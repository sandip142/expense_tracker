import 'package:expense_repository/src/model/category.dart';

abstract class ExpenseRepo{
  Future<void> createCategory(Category category);
  Future<List<Category>> getCategory();
}