import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:equatable/equatable.dart';
part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.homeRepo) : super(NewestBookInitial());
 final HomeRepoImpl homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBookInitial());
    var result = await homeRepo.fetchNewestBooks();
    result.fold(
      (failure) {
        emit(NewestBookFailure(failure.errMessage));
      },
      (books) {
        emit(NewestBookSuccess(books));
      },
    );
  }
}
