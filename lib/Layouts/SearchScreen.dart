import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Cubits/cubit.dart';
import 'package:news_app/Cubits/states.dart';

import '../Widgets/articleItemes.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    String searchWord = '';
    return BlocConsumer<NewCubit, NewsStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        var list = NewCubit.get(context).search;
        var formkey = GlobalKey<FormFieldState>();
        return Scaffold(
          appBar: AppBar(),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    key: formkey,
                    style: TextStyle(
                        color: NewCubit.get(context).isdark == true
                            ? Colors.white
                            : Colors.black),
                    decoration: InputDecoration(
                        prefixIconColor: (NewCubit.get(context).isdark == true
                            ? Colors.white
                            : Colors.black),
                        prefixIcon: const Icon(Icons.search),
                        label: Text(
                          "Search",
                          style: NewCubit.get(context).isdark == true
                              ? const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)
                              : const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      searchWord = value;
                    },
                    onFieldSubmitted: (value) {
                      formkey.currentState?.validate();
                      NewCubit.get(context).search = [];
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Search must not be Empty';
                      }
                      NewCubit.get(context).getSearch(searchWord);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: list.isNotEmpty
                        ? ListView.separated(

                            // to remove scroll view when reach a top or an end of list
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                articleBuildItem(context, list[index]),
                            separatorBuilder: (context, index) =>
                                divider(context),
                            itemCount: list.length)
                        : const Center(
                            child: CircularProgressIndicator(),
                          )),
              ],
            ),
          ),
        );
      },
    );
  }
}
