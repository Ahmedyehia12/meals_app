import 'package:flutter/material.dart';
import 'screens/categories.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 14, 5, 35));

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CategoriesScreen(),
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: GoogleFonts.lato().fontStyle,
                  color: const Color.fromARGB(255, 19, 4, 54),
                  fontSize: 19.0,
                ),
              )),
      themeMode: ThemeMode.system,
    );
  }
}

void main() {
  runApp(const App());
}