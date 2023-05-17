import 'package:bloc/bloc.dart';
import 'package:bookly/module/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/home_repo.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this._homeRepo) : super(BestSellerInitial());
  final HomeRepo _homeRepo;
  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerBookLoadingState());
    var result = await _homeRepo.fetchBestSellerBooks();
    result.fold((failure) {
      emit(BestSellerBookFailureState(failure.errormassage));
    }, (books) {
      emit(BestSellerBookSucessState(books));
    });
  }
}
