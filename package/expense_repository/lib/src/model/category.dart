import 'package:expense_repository/src/entity/category_entites.dart';


/*This class represents the model for a category in your Flutter application. 
It mirrors the structure of CategoryEntity but is tailored for use within your app*/
class Category {
   String categoryId;
   String name;
   int totalExpenses;
   String icon;
   int color;

  Category({
    required this.categoryId,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.color,
  });


/*The static constant empty represents an empty/default category. It's useful when you need
 to initialize a category without specific data.*/

  static final empty = Category(
    categoryId: "",
    name: "",
    totalExpenses: 0,
    icon: '',
    color: 0,
  );


/*The method toEntity() converts a Category object into a CategoryEntity object.
 It creates a new CategoryEntity instance using the values of the Category instance's properties.
 which goes and did all firebase communication in Category entity*/ 
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpenses: totalExpenses,
      icon: icon,
      color: color,
    );
  }


/*The static method fromEntity() constructs a Category object from a CategoryEntity object. It takes
 a categoryEntity instance as input and extracts the values for each property to create a new 
Category instance which get data from Category entity which is come from firebase */
  static Category fromEntity(CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      totalExpenses: entity.totalExpenses,
      icon: entity.icon,
      color: entity.color,
    );
  }
}


/* Overall, this code facilitates the conversion between Category objects used within your 
Flutter application and CategoryEntity objects used for storing data in Firestore. It 
provides a clean separation between your application logic and data storage concerns, 
making your code more modular and easier to maintain*/