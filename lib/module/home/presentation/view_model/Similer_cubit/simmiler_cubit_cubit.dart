import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'simmiler_cubit_state.dart';

class SimmilerCubitCubit extends Cubit<SimmilerCubitState> {
  SimmilerCubitCubit(this._homeRepo) : super(SimmilerCubitInitial());

  final HomeRepo _homeRepo;
  Future<void> fetchSimmlerBooks(String category) async {
    emit(SimilerkLoadingState());
    var result = await _homeRepo.ferchRelventBooks(category);
    result.fold((failure) {
      emit(SimilerkFailureState(failure.errormassage));
    }, (books) {
      emit(SimilerkSucessState(books));
    });
  }
}
