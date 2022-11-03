import 'package:flutter/material.dart';
import 'package:projeto_repositories_git_clean/src/features/search/presentator/blocs/favorites_bloc/favorites_bloc.dart';
import 'package:projeto_repositories_git_clean/src/features/search/presentator/blocs/search_bloc/search_bloc.dart';
import 'package:projeto_repositories_git_clean/src/features/search/presentator/blocs/user_repositories_bloc/repositories_bloc.dart';
import 'package:projeto_repositories_git_clean/src/features/search/presentator/blocs/users_details_bloc/users_bloc.dart';
import 'package:projeto_repositories_git_clean/src/features/search/presentator/views/splash/splash_page.dart';
import 'src/core/injection/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoritesBloc>(
          create: (_) => di.sl<FavoritesBloc>(),
        ),
        BlocProvider<SearchBloc>(
          create: (_) => di.sl<SearchBloc>(),
        ),
        BlocProvider<UsersBloc>(
          create: (_) => di.sl<UsersBloc>(),
        ),
        BlocProvider<RepositoriesBloc>(
          create: (_) => di.sl<RepositoriesBloc>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
