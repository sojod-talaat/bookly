import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/core/widgets/custom-button.dart';
import 'package:bookly/module/home/presentation/view/widgets/Custom_Book_Image.dart';
import 'package:bookly/module/home/presentation/view/widgets/box_action.dart';
import 'package:bookly/module/home/presentation/view/widgets/custom_rate_row.dart';
import 'package:bookly/module/home/presentation/view/widgets/simeller_list_view.dart';
import 'package:flutter/material.dart';

import '../../../data/models/book_model/book_model.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .2),
            child: CustomBookImage(
                imageurl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg'),
          ),
          const SizedBox(
            height: 43,
          ),
          Text(
            bookModel.volumeInfo?.title ?? 'book title',
            style: Style.textStyle30.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 6,
          ),
          Opacity(
            opacity: .7,
            child: Text(
              bookModel.volumeInfo?.authors?[0] ?? 'book auther',
              style: Style.textStyle18.copyWith(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          CustomRateRow(
            mainAxisAlignment: MainAxisAlignment.center,
            count: bookModel.volumeInfo?.ratingsCount ?? 90,
            rate: bookModel.volumeInfo?.averageRating ?? 4.8,
          ),
          const SizedBox(
            height: 37,
          ),
          BoxAction(bookModel),
          Expanded(
            child: SizedBox(
              height: 50,
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You Can also like,',
                style: Style.textStyle14.copyWith(fontWeight: FontWeight.w600),
              )),
          const SizedBox(
            height: 16,
          ),
          SimlierListViewBook(),
        ],
      ),
    );
  }
}
