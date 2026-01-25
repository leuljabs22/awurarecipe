import 'package:flutter/material.dart';
import '../models/recipe_model.dart';
import '../services/recipe_services.dart';

class RecipeViewModel extends ChangeNotifier {
  final RecipeService _service = RecipeService();
  
  List<Breakfast> _breakfasts = [];
  bool _isLoading = false;
  String? _errorMessage;

  
  List<Breakfast> get recipes => _breakfasts;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadRecipes() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); 

    try {
      _breakfasts = await _service.fetchRecipes();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners(); 
    }
  }
}





