import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_repositories_git_clean/src/features/data/datasources/remote/github_remote_datasource_implementation.dart';
import 'package:projeto_repositories_git_clean/src/features/data/repositories/github_repository_implementation.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/repositories/github_repository.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/usecases/favorites/get_favorites_users_usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/usecases/git_repositories/get_git_repositories_usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/usecases/users/get_user_usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/usecases/users/get_users_by_name_usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/usecases/users/save_users_usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/presentator/blocs/favorites_bloc/favorites_bloc.dart';
import 'package:projeto_repositories_git_clean/src/features/presentator/blocs/search_bloc/search_bloc.dart';
import 'package:projeto_repositories_git_clean/src/features/presentator/blocs/users_details_bloc/users_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../features/data/datasources/local/github_local_datasource.dart';
import '../../features/data/datasources/local/github_local_datasource_implementation.dart';
import '../../features/data/datasources/remote/github_remote_datasource.dart';
import '../network/network_info.dart';
import '../network/network_info_implementation.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //features

  //bloc
  sl.registerFactory(
      () => SearchBloc(getUserUseCase: sl(), getGitRepositoriesUsecase: sl()));
  sl.registerFactory(() => FavoritesBloc(getFavoritesUsersUsecase: sl()));
  sl.registerFactory(() => UsersBloc(getUsersByNameUsecase: sl()));
  //usecases
  sl.registerLazySingleton(
      () => GetFavoritesUsersUsecase(githubRepository: sl()));
  sl.registerLazySingleton(
      () => GetGitRepositoriesUsecase(githubRepository: sl()));
  sl.registerLazySingleton(() => GetUserUsecase(githubRepository: sl()));
  sl.registerLazySingleton(() => GetUsersByNameUsecase(githubRepository: sl()));
  sl.registerLazySingleton(() => SaveUserUsecase(githubRepository: sl()));

  //repository
  sl.registerLazySingleton<IGithubRepository>(
    () => GithutRepositoryImplementation(
      githubLocalDataSource: sl(),
      githubRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //datasource
  sl.registerLazySingleton<IGithubRemoteDataSource>(
      () => GithubRemoteDatasourceImplementation(client: sl()));

  sl.registerLazySingleton<IGithubLocalDataSource>(
      () => GithubLocalDataSourceImplementation(sharedPreferences: sl()));
  //core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplementation(sl()));

  //external

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
