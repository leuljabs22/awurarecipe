
  import 'package:flutter/foundation.dart';
 import 'package:awurarecipe/models/recipe_model.dart';
  import 'package:awurarecipe/services/recipe_services.dart';

class RecipeViewModel extends ChangeNotifier{
  final RecipeService _recipeService = RecipeService();
  List <Breakfast> _recipe = [];
  bool _loading = false;

List <Breakfast> get recipe => _recipe;
bool get loading => _loading;

Future<void> fetchRecipe() async {
  _loading = true;
  notifyListeners();

  _recipe = await _recipeService.fetchRecipe();

_loading =false;
notifyListeners();

}
}


