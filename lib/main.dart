import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/recipe_viewmodel.dart';
import 'views/recipe_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeViewModel()..loadRecipes()),
      ],
      child: const AwurakitchenApp(),
    ),
  );
}

class AwurakitchenApp extends StatelessWidget {
  const AwurakitchenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Awura's Kitchen",

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD48C70),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      home: const RecipeView(),
    );
  }
}
