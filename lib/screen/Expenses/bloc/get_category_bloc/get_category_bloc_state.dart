part of 'get_category_bloc_bloc.dart';

sealed class GetCategoryBlocState extends Equatable {
  const GetCategoryBlocState();
  
  @override
  List<Object> get props => [];
}

final class GetCategoryBlocInitial extends GetCategoryBlocState {}

final class GetCategoryBlocFailure extends GetCategoryBlocState {}
final class GetCategoryBlocLoading extends GetCategoryBlocState {}
final class GetCategoryBlocSuccess extends GetCategoryBlocState {
  final List<Category> getCategories;
  const GetCategoryBlocSuccess(this.getCategories);
     
     @override
    List<Object> get props => [getCategories];
}

