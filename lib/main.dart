import 'package:bookly/app-router.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_serviecs.dart';
import 'package:bookly/core/utils/services_locator.dart';
import 'package:bookly/module/home/data/repos/home_repo_implemtion.dart';
import 'package:bookly/module/home/presentation/view_model/best_seller_cubit/best_seller_cubit.dart';
import 'package:bookly/module/home/presentation/view_model/home_book_cubit/home_book_cubit.dart';
import 'package:bookly/module/splash/presentation/view/splash.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBookCubit(getIt.get<HomeRepoImplemention>())
            ..fetchHomeBooks(),
        ),
        BlocProvider(
          create: (context) =>
              BestSellerCubit(getIt.get<HomeRepoImplemention>())
                ..fetchBestSellerBooks(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kprimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
