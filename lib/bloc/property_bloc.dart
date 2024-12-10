import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sleekdxb/models/property_model.dart';
import 'package:sleekdxb/services/property.dart';

part 'property_event.dart';
part 'property_state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final PropertyService _propertyService;

  PropertyBloc(this._propertyService) : super(PropertyLoading()) {
    on<LoadPropertiesEvent>((event, emit) async {
      emit(PropertyLoading());
      try {
        final properties = await _propertyService.fetchPropertyList();
        emit(PropertyLoaded(property: properties));
      } catch (e) {
        emit(PropertyErrorState(e.toString()));
      }
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
