import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/module/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:bookly/module/home/presentation/view/widgets/custom_bestselleritem.dart';
import 'package:bookly/module/home/presentation/view/widgets/custome_app_bar.dart';
import 'package:bookly/module/home/presentation/view/widgets/custome_listview.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets_const.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomAppBar(),
                ),
                CustomListView(),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Best Seller',
                    style: Style.textStyle18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ]),
        ),
        const SliverFillRemaining(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: BestSellerListView()))
      ]),
    );
  }
}

// ignore: use_key_in_widget_constructors
