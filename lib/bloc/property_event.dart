part of 'property_bloc.dart';

sealed class PropertyEvent extends Equatable {
  const PropertyEvent();

  @override
  List<Object> get props => [];
}

class LoadProperties extends PropertyEvent {}

class AddProperty extends PropertyEvent {
  final Property property;

  const AddProperty(this.property);

  @override
  List<Object> get props => [property];
}

class DeleteProperty extends PropertyEvent {
  final Property property;

  const DeleteProperty(this.property);

  @override
  List<Object> get props => [property];
}
