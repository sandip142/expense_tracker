part of 'create_category_bloc_bloc.dart';

sealed class CreateCategoryBlocState extends Equatable {
  const CreateCategoryBlocState();
  
  @override
  List<Object> get props => [];
}

final class CreateCategoryBlocInitial extends CreateCategoryBlocState {}
final class CreateCategoryBlocLoading extends CreateCategoryBlocState {}
final class CreateCategoryBlocFailure extends CreateCategoryBlocState {}
final class CreateCategoryBlocSuccess extends CreateCategoryBlocState {}
