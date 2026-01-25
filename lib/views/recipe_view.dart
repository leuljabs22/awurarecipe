import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/recipe_viewmodel.dart';
import '../views/recipe_detail_view.dart';

class RecipeView extends StatelessWidget {
  const RecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RecipeViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Awura's Kitchen")),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: viewModel.recipes.length,
              itemBuilder: (context, index) {
                final recipe = viewModel.recipes[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(recipe.image),
                  ),
                  title: Text(recipe.name),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailView(breakf: recipe),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.loadRecipes(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
