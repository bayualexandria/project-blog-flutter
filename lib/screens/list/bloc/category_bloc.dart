import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login/screens/list/model/category_model.dart';
import 'package:login/service/category/category_service.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required CategoryService categoryService})
      : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      if (event is GetDataCategory) {
        emit(CategoryLoaded());
        try {
          await categoryService.get();
        } catch (e) {
          throw Exception(e.toString());
        }
      }
    });
  }
}
