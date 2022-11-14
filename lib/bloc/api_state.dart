import 'package:apicalling/model/model.dart';
import 'package:equatable/equatable.dart';

class ApiState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ApiNotSearched extends ApiState {}

class ApiIsLoading extends ApiState {}

class ApiIsLoaded extends ApiState {
  final weather;

  ApiIsLoaded(this.weather);

  List<ApiModel> get getWeather => weather;

  @override
  // TODO: implement props
  List<Object> get props => [weather];
}

class ApiIsNotLoaded extends ApiState {}

class ApiErrorState extends ApiState {}
