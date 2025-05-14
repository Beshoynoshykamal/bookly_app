import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if(state is FeaturedBooksSuccess){
          return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: (){
                     GoRouter.of(context).push(AppRouter.bookDetailsView,extra:state.books[index]);
                  },
                  child: CustomBookImage(
                    imageUrl:state.books[index].volumeInfo.imageLinks.thumbnail,
                  ),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        );
        }
        else if(state is FeaturedBooksFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        else{
          return const CustomLoadingIndicator();
          
        }
      },
    );
  }
}
