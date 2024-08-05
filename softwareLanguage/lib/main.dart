import 'package:flutter/material.dart';
import 'package:flutter_application_1/konu_page.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'user_store.dart';
import 'profile_page.dart';
import 'soru_cevap_page.dart';
import 'forum_page.dart';
import 'quiz_page.dart';
import 'ders_page.dart';
import 'konu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserStore(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Debug yazısını kaldırmak için
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterPage(),
        '/profile': (context) => ProfilePage(),
        '/soru-cevap': (context) => SoruCevapPage(),
        '/forum': (context) => ForumPage(),
        '/quiz': (context) => QuizPage(subject: ModalRoute.of(context)!.settings.arguments as String),
        '/ders': (context) => DersPage(subject: ModalRoute.of(context)!.settings.arguments as String),
        '/konu': (context) => KonuPage(),
      },
    );
  }
}
