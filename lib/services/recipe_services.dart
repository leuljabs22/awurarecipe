
import 'package:awurarecipe/models/recipe_model.dart';

class RecipeService {
  Future<List<Breakfast>> fetchRecipe() async {
    await Future.delayed(const Duration(milliseconds: 4)); //500

    return [
      Breakfast(
        id: '1',
        name: 'Classic Ethiopian Firfir',
        imageUrl:
          'https://4.bp.blogspot.com/_TgpeKhnKoXU/SYIoNA5LN6I/AAAAAAAAAXs/qSCo4EvnhaU/s400/firfir.JPG', //working this way

        ingredient: [
          Ingredient(name: 'Onions', quantity: "1 cup finely chopped "),
          Ingredient(name: 'Tomatoes', quantity: "4 Pieces"),
          Ingredient(name: 'Berbere spice', quantity: "2 Tablespoon"),
          Ingredient(name: 'Garlic', quantity: "4 Pieces"),
          Ingredient(name: 'Olive Oil', quantity: "2 tablespoons"),
          Ingredient(name: 'Injera', quantity: "4 cups torn"),
          Ingredient(name: 'Water', quantity: "1/4 Litres"),
          Ingredient(name: 'Salt to tase', quantity: "As desired"),
        ],
      ),
      Breakfast(
        id: '2',
        name: 'Enkulal firfir',
        imageUrl:
          'https://i.ytimg.com/vi/y560KnFBhnk/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLADKGG95o2-oDjiCSnH1Uo2FiLtng',

        ingredient: [
          Ingredient(name: 'Eggs', quantity: "4 Large "),
          Ingredient(name: 'Olive Oil', quantity: "2 tablespoons"),
          Ingredient(name: 'Onions', quantity: "1 cup finely chopped "),
          Ingredient(name: 'Garlic', quantity: "4 cloves minced"),
          Ingredient(name: 'Tomatoe(choped or diced)', quantity: "1-2"),
          Ingredient(name: 'Green chili(finely chopped)', quantity: "1 piece"),
          Ingredient(name: 'Salt and black pepper', quantity: "As desired"),
        ],
      ),

      Breakfast(
        id: '3',
        name: 'Chechebsa',
        imageUrl:
          'https://media.licdn.com/dms/image/v2/C4D22AQGxjqM3O-bv3A/feedshare-shrink_800/feedshare-shrink_800/0/1667378625191?e=2147483647&v=beta&t=Ei0QY2zXJyihChekUUZzuq9_tN2xgaySkAs5MfgEpyI',

        ingredient: [
          Ingredient(name: 'Oil', quantity: "for greasing the pan"),
          Ingredient(name: 'Almond Flour', quantity: "1 cup of key"),
          Ingredient(name: 'Water', quantity: "2 cups"),
          Ingredient(name: 'Berbere spice', quantity: "1 Tablespoon"),
          Ingredient(name: 'Garlic', quantity: "4 Pieces"),
          Ingredient(name: 'Vegetable Oil', quantity: "2 tablespoons"),
          Ingredient(name: 'Salt to tase', quantity: "As desired"),
        ],
      ),

      Breakfast(
        id: '4',
        name: 'Kinche',
        imageUrl:
          'https://z-p3-scontent.fadd2-1.fna.fbcdn.net/v/t1.6435-9/186371007_2800638093599881_4282995417824773220_n.jpg?stp=dst-jpg_p526x296_tt6&_nc_cat=110&ccb=1-7&_nc_sid=3a1ebe&_nc_ohc=gSOQX-BmjRwQ7kNvwFAzF4R&_nc_oc=AdkXmkSKJY2YljzUKSodQ0UJGmUYnE0LYLAL-DKZgOtheWiYDeFA07w0m8_ZFWFwPVU&_nc_zt=23&_nc_ht=z-p3-scontent.fadd2-1.fna&_nc_gid=b88lKAV3Rb_eD2DC2Y-gdg&oh=00_Afl4tk7ImoB6mEIz2hZAgf7wo7Rbxu66zssRqvwlJVyZ1A&oe=697AF128',
        
        ingredient: [
          Ingredient(name: 'Wheat', quantity: '1 cup cracked'),
          Ingredient(name: 'Water', quantity: '2-3 cups'),
          Ingredient(name: 'Ethiopian butter', quantity: '2 tabespoons''Not for fasting'),
          Ingredient(name: 'Olive Oil', quantity: '2 tablespoons''This one can be added if your fasting'),
          Ingredient(name: 'Salt to taste', quantity: 'As desired'),
        ],
      ),
    ];
  }
}
