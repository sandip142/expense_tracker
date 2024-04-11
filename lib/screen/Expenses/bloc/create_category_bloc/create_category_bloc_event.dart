part of 'create_category_bloc_bloc.dart';



sealed class CreateCategoryBlocEvent extends Equatable {
  const CreateCategoryBlocEvent();

  @override
  List<Object> get props => [];
}

class CreateCategory extends CreateCategoryBlocEvent{

  final Category category;
  const CreateCategory(this.category);
  
  @override
  List<Object> get props => [category];

}


