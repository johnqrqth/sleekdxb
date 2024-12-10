part of 'property_bloc.dart';

sealed class PropertyState extends Equatable {}

final class PropertyLoading extends PropertyState {
  @override
  List<Object?> get props => [];
}

final class PropertyLoaded extends PropertyState {
  final List<Property> property;

  PropertyLoaded({required this.property});

  @override
  List<Object> get props => [property];
}

final class PropertyErrorState extends PropertyState {
  final String error;

  PropertyErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
