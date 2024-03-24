import 'package:flutter/material.dart';
import 'package:news_app/style/theme.dart';
import 'package:news_app/ui/Home/home_screen.dart';
import 'package:news_app/ui/Home/widgets/detalis_screen/detailsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEWS APP',
      theme:AppTheme.LightTheme,
      initialRoute:HomeScreen.route,
      routes: {
        HomeScreen.route:(_) =>HomeScreen(),
        DetailsScreen.route:(_) =>DetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

