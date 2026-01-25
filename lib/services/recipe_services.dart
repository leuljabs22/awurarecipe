import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe_model.dart';

class RecipeService {
  final String apiUrl =
      "https://raw.githubusercontent.com/leuljabs22/awurarecipe/main/recipe.json";
  Future<List<Breakfast>> fetchRecipes() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Breakfast.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load recipes");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }
}
