import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme
          .of(context)
          .textTheme
          .headline1),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute
        .of(context)
        .settings
        .arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (ctx, child, event) {
                    if (event == null) {
                      return child;
                    } else {
                      return Container(
                        height: 250,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.pink,
                            value: event.expectedTotalBytes != null
                                ? event.cumulativeBytesLoaded /
                                event.expectedTotalBytes
                                : null,
                          ),
                        ),
                      );
                    }
                  },
                )),
            buildSectionTitle("Ingredientes", context),
            buildContainer(
              ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) =>
                      Column(
                        children: [
                          Card(
                            color: Theme
                                .of(context)
                                .accentColor,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(selectedMeal.ingredients[index])),
                          ),
                          Divider(),
                        ],
                      )),
            ),
            buildSectionTitle("Steps", context),
            buildContainer(ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) =>
                    ListTile(
                      title: Text(selectedMeal.steps[index]),
                      leading: CircleAvatar(child: Text("# ${(index + 1)}")),
                    )))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete), onPressed: () {
        Navigator.of(context).pop(mealId);
      },),);
  }
}
