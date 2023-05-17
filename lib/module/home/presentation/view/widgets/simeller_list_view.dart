import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/module/home/presentation/view/widgets/Custom_Book_Image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/Similer_cubit/simmiler_cubit_cubit.dart';

class SimlierListViewBook extends StatelessWidget {
  const SimlierListViewBook({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimmilerCubitCubit, SimmilerCubitState>(
      builder: (context, state) {
        if (state is SimilerkSucessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CustomBookImage(
                      imageurl: state
                              .books[index].volumeInfo?.imageLinks?.thumbnail ??
                          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg'),
                );
              },
            ),
          );
        } else if (state is SimilerkFailureState) {
          return CustomErrorWidget(state.errormassege);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
