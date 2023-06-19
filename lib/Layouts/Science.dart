import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubits/cubit.dart';
import '../Cubits/states.dart';
import '../Widgets/articleItemes.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = NewCubit.get(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<NewCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (cubit.Science.isNotEmpty) {
            return ListView.separated(
                // to remove scroll view when reach a top or an end of list
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    articleBuildItem(context, cubit.Science[index]),
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
