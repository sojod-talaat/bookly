import 'package:bloc/bloc.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/module/home/data/models/book_model/book_model.dart';
import 'package:bookly/module/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_book_state.dart';

class HomeBookCubit extends Cubit<HomeBookState> {
  HomeBookCubit(this._homeRepo) : super(HomeBookInitial());
  final HomeRepo _homeRepo;
  Future<void> fetchHomeBooks() async {
    emit(HomeBookLoadingState());
    var result = await _homeRepo.fetchHomeBooks();
    result.fold((failure) {
      emit(HomeBookFailureState(failure.errormassage));
    }, (books) {
      emit(HomeBookSucessState(books));
    });
  }
}
