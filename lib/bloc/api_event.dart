import 'package:equatable/equatable.dart';

class ApiEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ApiFetch extends ApiEvent {
  String city;

  ApiFetch(this.city);

  @override
  // TODO: implement props
  List<Object> get props => [city];
}

class ApiReset extends ApiEvent {}
