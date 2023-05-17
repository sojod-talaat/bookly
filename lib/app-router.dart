import 'package:bookly/core/utils/services_locator.dart';
import 'package:bookly/module/home/data/models/book_model/book_model.dart';
import 'package:bookly/module/home/data/repos/home_repo_implemtion.dart';
import 'package:bookly/module/home/presentation/view/book-details.dart';
import 'package:bookly/module/home/presentation/view/home-page.dart';
import 'package:bookly/module/home/presentation/view_model/Similer_cubit/simmiler_cubit_cubit.dart';
import 'package:bookly/module/serach/presention/view/search_page.dart';
import 'package:bookly/module/splash/presentation/view/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHomePage = '/home';
  static const String kDetailsPage = '/detailsPage';
  static const String kSearchPage = '/searchpage';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashView(),
    ),
    GoRoute(
      path: kHomePage,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: kDetailsPage,
      builder: (context, state) => BlocProvider(
          create: (context) =>
              SimmilerCubitCubit(getIt.get<HomeRepoImplemention>()),
          child: BookDetailsPage(state.extra as BookModel)),
    ),
    GoRoute(
      path: kSearchPage,
      builder: (context, state) => SearchPage(),
    )
  ]);
}
