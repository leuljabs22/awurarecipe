
import 'package:flutter/material.dart';
import 'package:awurarecipe/Viewmodels/recipe_viewmodel.dart';
import 'package:provider/provider.dart';
import 'recipe_detail_view.dart'; 

class RecipeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.brown,
      
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
                    "What are we cooking Today?",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

           
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
     
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: recipe.id, 
                child: Image.network(
                  recipe.imageUrl, 
                  fit: BoxFit.cover, 
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.fastfood_rounded, color: Colors.grey, size: 50),
                    );
                  },
                ),
              ),
            ),
          ),
          
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
                    Text("Max: 15 mins To prepare", style: TextStyle(color: Colors.white70, fontSize: 12)),
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
      floatingActionButton:FloatingActionButton(
        backgroundColor:Colors.black,
        onPressed:() => recipeViewModel.fetchRecipe(), 
        child:Icon(Icons.search, color: Colors.white70,),
    ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white24,
      //   onPressed: () => recipeViewModel.fetchRecipe(),
      //   child: Icon(Icons.refresh, color: Colors.indigo),
      // ),//refresh button to see the breakfasts available
    );
  }
}









