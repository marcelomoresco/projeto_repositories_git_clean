import 'package:flutter/material.dart';
import 'package:projeto_repositories_git_clean/src/features/presentator/views/home/home_page.dart';
import 'package:projeto_repositories_git_clean/src/features/presentator/views/splash/splash_page.dart';
import 'src/core/injection/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
