import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksCubitState>(
      builder: (context, state) {
       if(state is SimilarBooksCubitSuccess){
         return SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: ListView.builder(
            itemCount:state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: CustomBookImage(imageUrl: state.books[index].volumeInfo.imageLinks.thumbnail),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        );
       }
       else if(state is SimilarBooksCubitFailure){
        return CustomErrorWidget(errMessage: state.errMessage);
       }
       else{
        return CustomLoadingIndicator();
       }
      },
    );
  }
}
