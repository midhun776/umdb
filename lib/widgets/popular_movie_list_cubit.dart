import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umdb/cubits/movie_list_ui_state.dart';
import 'package:umdb/cubits/popular_movie_cubit.dart';
import 'package:umdb/models/popular_movie_response.dart';

class PopularMovieListCubit extends StatefulWidget {
  const PopularMovieListCubit({super.key});

  @override
  State<PopularMovieListCubit> createState() => _PopularMovieListCubitState();
}

class _PopularMovieListCubitState extends State<PopularMovieListCubit> {

  @override
  void initState() {
    super.initState();

    context.read<PopularMovieCubit>().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //     itemCount: _popularMovieList.length,
    //     itemBuilder: ( context, index){
    //       return ListTile(
    //         title: Text(_popularMovieList[index].title ?? "No title"),
    //         subtitle: Text(_popularMovieList[index].year ?? "1999"),
    //       );
    //     }
    // );
    return BlocBuilder<PopularMovieCubit, UiState>(
        builder: (context, state) {
          return switch (state){
            Initial() => const Center(child: CircularProgressIndicator(),),
            Loading() => const Center(child: CircularProgressIndicator(),),
            Success() => ListView.builder(
                itemCount: state.movieList.length,
                itemBuilder: ( context, index){
                  return ListTile(
                    title: Text(state.movieList[index].title ?? "No title"),
                    subtitle: Text(state.movieList[index].year ?? "1999"),
                  );
                },
            ),
            Error() => const Center(child: Text('Something went wrong!'),),
          };
        }
    );

  }
}
