
import 'package:flutter/material.dart';
import 'package:awurarecipe/Viewmodels/recipe_viewmodel.dart';
import 'package:provider/provider.dart';
import 'recipe_detail_view.dart'; 

class RecipeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.grey[50], 
      body: SafeArea(
        child: Column(
          children: [
        
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Homemade Breakfast",
                    style: TextStyle(fontSize: 20, color: Colors.indigo, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "What are we cooking?",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // 2. The Main Feed
            Expanded(
              child: recipeViewModel.loading
                  ? Center(child: CircularProgressIndicator(color: Colors.indigo))
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: recipeViewModel.recipe.length,
                      itemBuilder: (context, index) {
  final recipe = recipeViewModel.recipe[index];
  
  return GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailView(recipe : recipe),
      ),
    ),
    child: Container(
      margin: EdgeInsets.only(bottom: 25),
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // 1. THE IMAGE (Fixed logic)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: recipe.id, // Enables the smooth transition
                child: Image.network(
                  recipe.imageUrl, // Use the real URL from your model
                  fit: BoxFit.cover, // This makes the image fill the container
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback if the URL is broken
                    return Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.fastfood, color: Colors.grey, size: 50),
                    );
                  },
                ),
              ),
            ),
          ),
          
          // 2. GRADIENT OVERLAY
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
          
          // 3. TEXT CONTENT
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name,
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 22, 
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.timer_outlined, color: Colors.white70, size: 16),
                    SizedBox(width: 4),
                    Text("Max: 20 mins", style: TextStyle(color: Colors.white70, fontSize: 12)),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "View Details",
                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
},
),
),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () => recipeViewModel.fetchRecipe(),
        child: Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}









