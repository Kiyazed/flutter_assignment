import 'package:flutter/material.dart';
import 'package:news_app/screens/category_screen.dart';
import 'package:news_app/screens/article.dart';
import 'package:news_app/screens/discover.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/screens/newsblog.dart';
import 'package:news_app/screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "",
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      //home: const Home(),
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        Discover.routeName: (context) => const Discover(),
        Article.routeName: (context) => const Article(),
        NewsBlog.routeName: (context) => const NewsBlog(
              desc: '',
              imageUrl: '',
              title: '',
              url: '',
            ),
        CategoryBlog.routeName: (context) => const CategoryBlog(),
        Profile.routename: (context) => const Profile(),
      },
    );
  }
}
