import 'package:bookly/app-router.dart';
import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/core/utils/assets_const.dart';
import 'package:bookly/module/home/data/models/book_model/book_model.dart';
import 'package:bookly/module/home/presentation/view/widgets/Custom_Book_Image.dart';
import 'package:bookly/module/home/presentation/view/widgets/custom_rate_row.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookItemWidget extends StatelessWidget {
  BookModel bookModel;
  BookItemWidget(this.bookModel);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouter.router.push(AppRouter.kDetailsPage, extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
                imageurl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg'),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel.volumeInfo?.title ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: Style.textStyle18,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      Text(
                        bookModel.volumeInfo?.authors![0] ?? 'sojod',
                        style: Style.textStyle14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text('Free', style: Style.textStyle14.copyWith()),
                      const SizedBox(
                        width: 110,
                      ),
                      Expanded(
                        child: CustomRateRow(
                          rate: bookModel.volumeInfo?.averageRating ?? 0,
                          count: bookModel.volumeInfo?.ratingsCount ?? 9,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
