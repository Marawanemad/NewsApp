import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/Api/CacheHelper.dart';
import 'package:news_app/Api/Dio_Helper.dart';
import 'package:news_app/Cubits/cubit.dart';
import 'package:news_app/Layouts/Home.dart';

import 'Cubits/states.dart';

void main() async {
  // to check any future line to do it before run app
  WidgetsFlutterBinding.ensureInitialized();
  // to call Dio and create it when app is running
  DioHelper.init();
  // to call sharedPreference and create it when app is running
  await CacheHelper.init();
  // to make variable from getter and send it in main to use in app easely
  bool? fromshared = CacheHelper.getModeData(key: "isDark");
  runApp(MyApp(fromshared!));
}

class MyApp extends StatelessWidget {
  final bool fromshared;
  const MyApp(this.fromshared, {super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewCubit()
        ..getBuisnessData()
        ..brightnessMode(fromshared: fromshared),
      child: BlocConsumer<NewCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: NewCubit.get(context).isdark == true
                  ? ThemeMode.dark
                  : ThemeMode.light,
              theme: ThemeData(
                // to make first color in app as default
                primarySwatch: Colors.deepOrange,
                // to make color to screen
                scaffoldBackgroundColor: Colors.grey[50],
                appBarTheme: const AppBarTheme(
                    // to make color to appbar
                    backgroundColor: Colors.white54,
                    // to make shadow under appbar =0 (no shadow)
                    elevation: 10,
                    iconTheme: IconThemeData(color: Colors.black, size: 30),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    toolbarHeight: 55,
                    // to change the upper bar (inside it date,time,battery)
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white10,
                      // to make icons in status bar light or dark
                      statusBarIconBrightness: Brightness.dark,
                    )),

                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Colors.white12,
                    elevation: 25,
                    selectedItemColor: Colors.deepOrangeAccent,
                    unselectedItemColor: Colors.grey[600]),
              ),
              darkTheme: ThemeData(
                // to make first color in app as default
                primarySwatch: Colors.blue, // to make color to screen
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                    // to make color to appbar
                    backgroundColor: HexColor('333739'),
                    // to make shadow under appbar =0 (no shadow)
                    elevation: 10,
                    iconTheme:
                        const IconThemeData(color: Colors.white, size: 30),
                    titleTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    toolbarHeight: 55,
                    // to change the upper bar (inside it date,time,battery)
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      // to make icons in status bar light or dark
                      statusBarIconBrightness: Brightness.light,
                    )),

                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: HexColor('333633'),
                    elevation: 50,
                    selectedItemColor: Colors.blue,
                    unselectedItemColor: Colors.grey[400]),
              ),
              home: const HomeScreen(),
            );
          }),
    );
  }
}
