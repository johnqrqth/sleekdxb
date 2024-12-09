import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sleekdxb/models/property_model.dart';

part 'property_event.dart';
part 'property_state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  PropertyBloc() : super(PropertyInitial()) {
    on<LoadProperties>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const PropertyLoaded(property: <Property>[]));
    });
    on<AddProperty>((event, emit) {
      if (state is PropertyLoaded) {
        final state = this.state as PropertyLoaded;
        emit(
          PropertyLoaded(
            property: List.from(state.property)..add(event.property),
          ),
        );
      }
    });
    on<DeleteProperty>((event, emit) {
      if (state is PropertyLoaded) {
        final state = this.state as PropertyLoaded;
        emit(
          PropertyLoaded(
            property: List.from(state.property)..remove(event.property),
          ),
        );
      }
    });
  }
}
