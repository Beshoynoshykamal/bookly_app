part of 'similar_books_cubit.dart';

sealed class SimilarBooksCubitState extends Equatable {
  const SimilarBooksCubitState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksCubitInitial extends SimilarBooksCubitState {}
final class SimilarBooksCubitSuccess extends SimilarBooksCubitState {
 final  List<BookModel> books;

 const SimilarBooksCubitSuccess(this.books);
}
final class SimilarBooksCubitFailure extends SimilarBooksCubitState {
  final String errMessage;
 const SimilarBooksCubitFailure(this.errMessage);
}
final class SimilarBooksCubitLoading extends SimilarBooksCubitState {}

