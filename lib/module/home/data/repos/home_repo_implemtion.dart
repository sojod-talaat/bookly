import 'package:bookly/core/utils/api_serviecs.dart';
import 'package:bookly/module/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/module/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplemention extends HomeRepo {
  final ApiServices apiServices;
  HomeRepoImplemention(this.apiServices);
  @override
  Future<Either<Failures, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      var data = await apiServices.getBook(
          'volumes?Filtering=free-ebooks&Sorting=newest&q=subjects:computer science');
      List<BookModel> bookList = [];
      for (var item in data['items']) {
        try {
          bookList.add(BookModel.fromJson(item));
        } on Exception catch (e) {
          bookList.add(BookModel.fromJson(item));
        }
      }
      return right(bookList);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioErroe(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchHomeBooks() async {
    try {
      var data = await apiServices
          .getBook('volumes?Filtering=free-ebooks&q=subjects:programming');
      List<BookModel> bookList = [];
      for (var item in data['items']) {
        bookList.add(BookModel.fromJson(item));
      }
      return right(bookList);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioErroe(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> ferchRelventBooks(
      String category) async {
    try {
      var data = await apiServices.getBook(
          'https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&Sorting=relevance&q=subjects:programming');
      List<BookModel> bookList = [];
      for (var item in data['items']) {
        bookList.add(BookModel.fromJson(item));
      }
      return right(bookList);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioErroe(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
