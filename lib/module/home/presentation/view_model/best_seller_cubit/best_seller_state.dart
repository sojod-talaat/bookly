part of 'best_seller_cubit.dart';

abstract class BestSellerState extends Equatable {
  const BestSellerState();

  @override
  List<Object> get props => [];
}

class BestSellerInitial extends BestSellerState {}

class BestSellerBookInitial extends BestSellerState {}

class BestSellerBookLoadingState extends BestSellerState {}

class BestSellerBookFailureState extends BestSellerState {
  final String errormassege;
  const BestSellerBookFailureState(this.errormassege);
}

class BestSellerBookSucessState extends BestSellerState {
  final List<BookModel> books;
  const BestSellerBookSucessState(this.books);
}
