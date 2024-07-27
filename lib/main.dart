import 'package:flutter/material.dart';
import 'package:tractian_challenge/const.dart';
import 'package:tractian_challenge/view/home_page.dart';
import 'package:tractian_challenge/view/locations.dart';

void main() {
  runApp(const TractianChallenge());
}

class TractianChallenge extends StatelessWidget {
  const TractianChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tractian Challenge',
      initialRoute: '/',
      routes: {
        homeRouteName: (context) => const HomePage(),
        locationRouteName: (context) => const LocationsList(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}
