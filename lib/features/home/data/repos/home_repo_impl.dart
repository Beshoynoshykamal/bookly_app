import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?Filtering=free-ebooks&Sorting=newest&q=computer science",
           
      );
      List<BookModel> books = [];
      for (var item in data["items"]) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          //
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=noval",

      );
      List<BookModel> books = [];
      for (var item in data["items"]) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          //
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    try {
      var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&Sorting=relevance&q=$category",
    
      );
      List<BookModel> books = [];
      for (var item in data["items"]) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          //
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
   @override
  Future<Either< Failure,List<BookModel>>> fetchSearchBooks({required String category})
async{
    try {
      
      var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&Sorting=newest&q=$category",);
      List<BookModel> books = [];
      for (var item in data["items"]) {
        try {
          books.add(BookModel.fromJson(item));
     
        } catch (e) {
          //
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
