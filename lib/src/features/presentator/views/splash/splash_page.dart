import 'package:flutter/material.dart';

import '../home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _onLoading() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const HomePage(),
      ),
    );
  }

  @override
  void initState() {
    _onLoading();
    super.initState();
  }

  Widget build(BuildContext context) {
    final sizePhone = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: sizePhone.height,
        width: sizePhone.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 700),
              curve: Curves.decelerate,
              builder: (_, value, child) {
                return Opacity(opacity: value, child: child);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'GitHub Pesquisa',
                    style: TextStyle(fontSize: 19),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
