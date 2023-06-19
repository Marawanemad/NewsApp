import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Cubits/cubit.dart';
import 'package:news_app/Cubits/states.dart';

import 'SearchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("News App"),
            actions: [
              IconButton(
                icon: Icon(Icons.search_rounded),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    cubit.brightnessMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined))
            ],
          ),
          body: Center(child: cubit.Screens[cubit.currintIndex]),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.BottomNavList,
            currentIndex: cubit.currintIndex,
            onTap: (index) {
              cubit.onChangeIndex(index);
            },
          ),
        );
      },
    );
  }
}
