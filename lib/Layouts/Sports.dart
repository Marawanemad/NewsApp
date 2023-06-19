import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Widgets/articleItemes.dart';

import '../Cubits/cubit.dart';
import '../Cubits/states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = NewCubit.get(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<NewCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (cubit.Sports.isNotEmpty) {
            return ListView.separated(
                // to remove scroll view when reach a top or an end of list
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    articleBuildItem(context, cubit.Sports[index]),
                separatorBuilder: (context, index) => divider(context),
                itemCount: cubit.buisness.length);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
