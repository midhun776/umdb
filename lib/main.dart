import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umdb/cubits/popular_movie_cubit.dart';
import 'package:umdb/pages/login_page.dart';
import 'package:umdb/pages/splash_page.dart';

void main() {
  runApp(const UmdbApp());
}

class UmdbApp extends StatelessWidget {
  const UmdbApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PopularMovieCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
