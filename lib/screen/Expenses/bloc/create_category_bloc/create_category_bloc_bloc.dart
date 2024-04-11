import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';
part 'create_category_bloc_event.dart';
part 'create_category_bloc_state.dart';


class CreateCategoryBloc extends Bloc<CreateCategoryBlocEvent, CreateCategoryBlocState> {
  //following  is a Abstract class of Package we Created
  final ExpenseRepo expenseRepo;
  CreateCategoryBloc(this.expenseRepo) : super(CreateCategoryBlocInitial()) {
    on<CreateCategory>((event, emit) async{
      emit(CreateCategoryBlocLoading());

      try{
        
      await expenseRepo.createCategory(event.category);
      emit(CreateCategoryBlocSuccess());

      }catch(e){

        emit(CreateCategoryBlocFailure());
        rethrow;
      }
    });
  }
}
