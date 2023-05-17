import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../view_model/best_seller_cubit/best_seller_cubit.dart';
import 'custom_bestselleritem.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
        builder: (context, state) {
      if (state is BestSellerBookSucessState) {
        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: BookItemWidget(state.books[index]),
              );
            });
      } else if (state is BestSellerBookFailureState) {
        return CustomErrorWidget(state.errormassege);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
