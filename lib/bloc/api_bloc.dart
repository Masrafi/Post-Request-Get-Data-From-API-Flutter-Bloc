import 'package:apicalling/bloc/api_event.dart';
import 'package:apicalling/bloc/api_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/repository.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  Repository apiRepo;
  ApiBloc(this.apiRepo) : super(ApiNotSearched()) {
    on<ApiFetch>((event, emit) async {
      if (event is ApiFetch) {
        emit(ApiIsLoading());
        try {
          final user = await apiRepo.getData(event.city);
          emit(ApiIsLoaded(user));
        } catch (e) {
          emit(ApiErrorState());
        }
      } else if (event is ApiReset) {
        emit(ApiNotSearched());
      }
    });
  }
}
