import 'package:flutter/material.dart';
import '../models/recipe_model.dart';

class RecipeDetailView extends StatelessWidget {
  final Breakfast breakf;
  const RecipeDetailView({super.key, required this.breakf});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(breakf.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              breakf.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  ...breakf.ingredients.map(
                    (ing) => ListTile(
                      title: Text(ing.name),
                      trailing: Text(
                        ing.quantity,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),

                  const Text(
                    "Preparation Steps",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),

                  ...breakf.instructions.asMap().entries.map((entry) {
                    int index = entry.key;
                    String stepText = entry.value;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.brown,
                            child: Text(
                              "${index + 1}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              stepText,
                              style: const TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ),
                        ],
                      ),
                    );
                  }), //.toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
