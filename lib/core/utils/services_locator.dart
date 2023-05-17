import 'package:bookly/core/utils/api_serviecs.dart';
import 'package:bookly/module/home/data/repos/home_repo_implemtion.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImplemention>(
    HomeRepoImplemention(getIt.get<ApiServices>()),
  );
}
