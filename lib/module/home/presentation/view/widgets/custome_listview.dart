import 'package:bookly/app-router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/module/home/presentation/view/widgets/Custom_Book_Image.dart';
import 'package:bookly/module/home/presentation/view_model/home_book_cubit/home_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBookCubit, HomeBookState>(
      builder: (context, state) {
        if (state is HomeBookSucessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .23,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kDetailsPage,
                          extra: state.books[index]);
                    },
                    child: CustomBookImage(
                        imageurl: state.books[index].volumeInfo?.imageLinks
                                ?.thumbnail ??
                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg'),
                  ),
                );
              },
            ),
          );
        } else if (state is HomeBookFailureState) {
          return CustomErrorWidget(state.errormassege);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
