import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Cubits/cubit.dart';
import 'package:news_app/Cubits/states.dart';
import 'package:news_app/Widgets/articleItemes.dart';

class BuisnessScreen extends StatelessWidget {
  const BuisnessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = NewCubit.get(context);

    return Directionality(
      // to make words arabic from right to left
      textDirection: TextDirection.rtl,
      child: BlocConsumer<NewCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (cubit.buisness.isNotEmpty) {
            return ListView.separated(
                // to remove scroll view when reach a top or an end of list
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    articleBuildItem(context, cubit.buisness[index]),
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
