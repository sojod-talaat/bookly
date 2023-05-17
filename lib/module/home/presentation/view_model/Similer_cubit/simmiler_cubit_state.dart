part of 'simmiler_cubit_cubit.dart';

abstract class SimmilerCubitState extends Equatable {
  const SimmilerCubitState();

  @override
  List<Object> get props => [];
}

class SimmilerCubitInitial extends SimmilerCubitState {}

class SimilerkLoadingState extends SimmilerCubitState {}

class SimilerkFailureState extends SimmilerCubitState {
  final String errormassege;
  const SimilerkFailureState(this.errormassege);
}

class SimilerkSucessState extends SimmilerCubitState {
  final List<BookModel> books;
  const SimilerkSucessState(this.books);
}
