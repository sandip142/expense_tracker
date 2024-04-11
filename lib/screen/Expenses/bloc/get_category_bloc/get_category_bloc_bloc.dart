import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

part 'get_category_bloc_event.dart';
part 'get_category_bloc_state.dart';

class GetCategoryBlocBloc extends Bloc<GetCategoryBlocEvent, GetCategoryBlocState> {
  ExpenseRepo expenseRepo;
  GetCategoryBlocBloc(this.expenseRepo) : super(GetCategoryBlocInitial()) {
    on<GetCategory>((event, emit) async{
      emit(GetCategoryBlocLoading());
       try{
       List<Category> categories= await expenseRepo.getCategory();
       emit(GetCategoryBlocSuccess(categories));
       }catch(e){
        emit(GetCategoryBlocFailure());
        rethrow;
       }
    });
  }
}
