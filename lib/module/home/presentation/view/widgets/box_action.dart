import 'package:bookly/core/widgets/custom-button.dart';
import 'package:bookly/module/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BoxAction extends StatelessWidget {
  const BoxAction(this.bookModel, {super.key});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              bacgroundcolor: Colors.white,
              text: ('Free'),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
              textcolor: Colors.black,
            ),
          ),
          Expanded(
            child: CustomButton(
              onpresedFunction: () async {
                Uri uri = Uri.parse(bookModel.volumeInfo?.previewLink ??
                    'http://books.google.com/books?id=nfysCfUVs3UC&pg=PA176&dq=subjects:programming&hl=&cd=1&source=gbs_api');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              fontsize: 16,
              bacgroundcolor: Color(0xffEF8262),
              text: ('Free preview'),
              textcolor: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
          )
        ],
      ),
    );
  }
}
