import 'package:bookly_app/features/home/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String searchValue="";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            searchValue=value;
          });
        },

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text to search';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hintText: "Search",
          suffixIcon: IconButton(
            onPressed:() {
          onSearch(context,searchValue);
        },
            icon: Opacity(
              opacity: 0.8,
              child: const Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
            ),
          ),
        ),
      ),
    );
  }

  void onSearch(BuildContext context, String? value) {
     if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    
      BlocProvider.of<SearchBooksCubit>(
        context,
      ).fetchSearchBooks(query: value!);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
