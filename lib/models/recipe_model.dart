class Ingredient {
  final String name;
  final String quantity;

Ingredient ({
  required this.name, 
  required this.quantity
  }); 

}


class Breakfast{


final String id;
final String name;
final String imageUrl;
final List<Ingredient> ingredient;

Breakfast({
  required this.id, 
  required this.name,
  required this.imageUrl,
  required this.ingredient,
 
});

}

