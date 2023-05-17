part of 'home_book_cubit.dart';

abstract class HomeBookState extends Equatable {
  const HomeBookState();

  @override
  List<Object> get props => [];
}

class HomeBookInitial extends HomeBookState {}

class HomeBookLoadingState extends HomeBookState {}

class HomeBookFailureState extends HomeBookState {
  final String errormassege;
  const HomeBookFailureState(this.errormassege);
}

class HomeBookSucessState extends HomeBookState {
  final List<BookModel> books;
  const HomeBookSucessState(this.books);
}
