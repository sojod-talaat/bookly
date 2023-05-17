import 'package:bookly/module/home/data/models/book_model/book_model.dart';
import 'package:bookly/module/home/presentation/view/widgets/book-details-Body.dart';
import 'package:bookly/module/home/presentation/view/widgets/Custom_Book_Image.dart';
import 'package:bookly/module/home/presentation/view_model/Similer_cubit/simmiler_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage(this.bookModel, {super.key});
  final BookModel bookModel;

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

@override
class _BookDetailsPageState extends State<BookDetailsPage> {
  void initState() {
    BlocProvider.of<SimmilerCubitCubit>(context)
        .fetchSimmlerBooks(widget.bookModel.volumeInfo!.categories![0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsBody(bookModel: widget.bookModel),
      ),
    );
  }
}
