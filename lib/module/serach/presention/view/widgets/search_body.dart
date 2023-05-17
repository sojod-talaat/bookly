import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/module/home/presentation/view/widgets/custom_bestselleritem.dart';
import 'package:bookly/module/serach/presention/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'result_list_view.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: const [
              CustomTextField(),
              SizedBox(
                height: 12,
              ),
              Text(
                'Search Result',
                style: Style.textStyle18,
              ),
              Expanded(child: ResultListView())
            ],
          ),
        ),
      )
    ]);
  }
}
