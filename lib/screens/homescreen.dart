import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleekdxb/bloc/property_bloc.dart';
import 'package:sleekdxb/models/property_model.dart';
import 'package:sleekdxb/services/property.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PropertyBloc>(
          create: (BuildContext context) => PropertyBloc(PropertyService()),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: const Color(0xFF273272),
              title: const Text(
                "Sleekdxb",
                style: TextStyle(color: Colors.orange),
              )),
          body: blocBody()),
    );
  }
}

Widget blocBody() {
  return BlocProvider(
    create: (context) => PropertyBloc(
      PropertyService(),
    )..add(LoadPropertiesEvent()),
    child: BlocBuilder<PropertyBloc, PropertyState>(builder: (context, state) {
      if (state is PropertyLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is PropertyLoaded) {
        List<Property> propertyList = state.property;

        return ListView.builder(
          itemCount: propertyList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Card(
                color: Colors.blueGrey,
                child: ListTile(
                  title: Text(
                    '${propertyList[index].title}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        );
      }

      return Container();
    }),
  );
}
