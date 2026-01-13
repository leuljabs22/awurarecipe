// main.dart
import 'package:flutter/material.dart';
import 'package:awurarecipe/Viewmodels/recipe_viewmodel.dart';
import 'package:awurarecipe/views/recipe_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeViewModel()),
      ],
      child: MaterialApp(
        home: RecipeView(),
      ),
    );
  }
}