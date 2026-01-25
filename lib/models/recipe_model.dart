
class Ingredient {
  final String name;
  final String quantity;

  Ingredient({required this.name, required this.quantity});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? '',
    );
  }
}

class Breakfast {
  final String id;
  final String name;
  final String image;
  final List<String> instructions; 
  final List<Ingredient> ingredients;

  Breakfast({
    required this.id,
    required this.name,
    required this.image,
    required this.instructions,
    required this.ingredients,
  });

  factory Breakfast.fromJson(Map<String, dynamic> json) {
    return Breakfast(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      image: json['imageUrl'] ?? '', 
      ingredients: (json['ingredients'] as List?)
              ?.map((item) => Ingredient.fromJson(item))
              .toList() ?? [],
      instructions: List<String>.from(json['instructions'] ?? []),
    );
  }
}