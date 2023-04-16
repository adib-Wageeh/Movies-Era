import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_era_app/Features/search/data/repos/search_repo_impl.dart';
import '../../Features/home_page/data/repos/home_repo_impl.dart';
import 'api_services.dart';

GetIt getIt = GetIt.instance;

void setupSingleton(){

getIt.registerSingleton<ApiServices>(ApiServices(Dio()));

getIt.registerSingleton<HomeRepositoryImpl>(HomeRepositoryImpl(getIt.get<ApiServices>()));

getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(apiServices: getIt.get<ApiServices>()));


}