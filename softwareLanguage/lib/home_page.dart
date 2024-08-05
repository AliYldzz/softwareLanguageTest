import 'package:flutter/material.dart';
import 'package:flutter_application_1/konu_page.dart';
import 'package:provider/provider.dart';
import 'user_store.dart';
import 'profile_page.dart'; 
import 'forum_page.dart'; 
import 'soru_cevap_page.dart'; 
import 'login_page.dart';
import 'ders_page.dart';
import 'quiz_page.dart';
import 'register_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Coding Face"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildBox(context, "Forum", '/forum'),
                  SizedBox(width: 20),
                  buildBox(context, "Soru-Cevap", '/soru-cevap'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildBox(context, "Hesabım", '/profile'),
                  SizedBox(width: 20),
                  buildBox(context, "Konular", '/konu'),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[50],
    );
  }

  Widget buildBox(BuildContext context, String text, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

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
      debugShowCheckedModeBanner: false,
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
        '/konu': (context) => KonuPage(), // Settings sayfası eklendi
      },
    );
  }
}
