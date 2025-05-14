import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
       if(state is SearchBooksSuccess) {
          return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
           itemCount: state.books.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),

               child: BestSellerListViewItem(bookModel:state.books[index] ),
            );
          },
         
        );
       }
       else if(state is SearchBooksFailure){
        return CustomErrorWidget(errMessage: state.errMessage);
       }
       else if(state is SearchBooksLoading){
        return CustomLoadingIndicator();
       }
       else {
        return Expanded(child: Container());
       }
      },
    );
  }
}
