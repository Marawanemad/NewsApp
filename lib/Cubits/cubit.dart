import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Api/CacheHelper.dart';
import 'package:news_app/Api/Dio_Helper.dart';
import 'package:news_app/Cubits/states.dart';
import 'package:news_app/Layouts/Buisness.dart';
import 'package:news_app/Layouts/Science.dart';
import 'package:news_app/Layouts/Sports.dart';

class NewCubit extends Cubit<NewsStates> {
  NewCubit() : super(IntialState());
  static NewCubit get(context) => BlocProvider.of(context);

  int currintIndex = 0;
  List<BottomNavigationBarItem> BottomNavList = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center_rounded), label: "Business"),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_rounded), label: "Science"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
  ];
  List<Widget> Screens = const [
    BuisnessScreen(),
    ScienceScreen(),
    SportsScreen()
  ];
  void onChangeIndex(int index) {
    if (index == 1) {
      getScienceData();
    }
    if (index == 2) {
      getSportsData();
    }
    currintIndex = index;
    emit(ChangeBottomNavState());
  }

// change brightnes mode button
  bool isdark = true;
  void brightnessMode({fromshared}) {
    if (fromshared != null) {
      isdark = fromshared;
      emit(ChangeBrightnessModeState());
    } else {
      isdark = !isdark;
      CacheHelper.putModeData(key: "isDark", value: isdark).then((value) {
        emit(ChangeBrightnessModeState());
      });
    }
  }

// make list to store Buisness data we call in it
  List<dynamic> buisness = [];
// make method get to call data from api
  void getBuisnessData() {
    // to make loading state
    emit(getBuisnessDataLoadingState());
// call getData from DioHelper and give it path and query we want to return thier data
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        "country": "eg",
        "category": "business",
        "apiKey": "65f7f556ec76449fa7dc7c0069f040ca"
      },
    ).then((value) {
// store this data in the list and make emit and catch error
      buisness = value.data['articles'];
      emit(getBuisnessDataSuccessState());
    }).catchError((error) {
      emit(getBuisnessDataErrorState(error));
    });
  }

// make list to store Sports data we call in it
  List<dynamic> Sports = [];
// make method get to call data from api
  void getSportsData() {
    if (Sports.length == 0) {
      // to make loading state
      emit(getSportsDataLoadingState());
// call getData from DioHelper and give it path and query we want to return thier data
      DioHelper.getData(
        path: 'v2/top-headlines',
        query: {
          "country": "eg",
          "category": "sports",
          "apiKey": "65f7f556ec76449fa7dc7c0069f040ca"
        },
      ).then((value) {
// store this data in the list and make emit and catch error
        Sports = value.data['articles'];
        emit(getSportsDataSuccessState());
      }).catchError((error) {
        emit(getSportsDataErrorState(error));
      });
    } else {
      emit(getSportsDataSuccessState());
    }
  }

  // make list to store Scince data we call in it
  List<dynamic> Science = [];
// make method get to call data from api
  void getScienceData() {
    if (Science.length == 0) {
// to make loading state
      emit(getBuisnessDataLoadingState());
// call getData from DioHelper and give it path and query we want to return thier data
      DioHelper.getData(
        path: 'v2/top-headlines',
        query: {
          "country": "eg",
          "category": "science",
          "apiKey": "65f7f556ec76449fa7dc7c0069f040ca"
        },
      ).then((value) {
// store this data in the list and make emit and catch error
        Science = value.data['articles'];
        emit(getScienceDataSuccessState());
      }).catchError((error) {
        emit(getScienceDataErrorState(error));
      });
    } else {
      emit(getScienceDataSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
// to make loading state
    emit(getSearchDataLoadingState());

// call getData from DioHelper and give it path and query we want to return thier data
    DioHelper.getData(
      path: 'v2/everything',
      query: {
        "q": "$value",
        "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
      },
    ).then((value) {
// store this data in the list and make emit and catch error
      search = value.data['articles'];
      emit(getSearchDataSuccessState());
    }).catchError((error) {
      emit(getSearchDataErrorState(error));
    });
  }
}
