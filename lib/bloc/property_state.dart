part of 'property_bloc.dart';

sealed class PropertyState extends Equatable {
  const PropertyState();

  @override
  List<Object> get props => [];
}

final class PropertyInitial extends PropertyState {}

final class PropertyLoaded extends PropertyState {
  final List<Property> property;

  const PropertyLoaded({required this.property});

  @override
  List<Object> get props => [property];
}
