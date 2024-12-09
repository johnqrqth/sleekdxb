import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleekdxb/bloc/property_bloc.dart';
import 'package:sleekdxb/models/property_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PropertyBloc()..add(LoadProperties()))
      ],
      child: MaterialApp(
        title: 'Sleekdxb',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF273272),
        title: const Text(
          "Sleekdxb",
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Center(
        child:
            BlocBuilder<PropertyBloc, PropertyState>(builder: (context, state) {
          if (state is PropertyInitial) {
            return const CircularProgressIndicator(color: Color(0xFF273272));
          }
          if (state is PropertyLoaded) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        for (int index = 0;
                            index < state.property.length;
                            index++)
                          Positioned(
                              child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Image(
                                      image: NetworkImage(
                                          state.property[index].imageUrl))))
                      ],
                    ),
                  )
                ]);
          } else {
            return const Text("Something went wrong");
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PropertyBloc>().add(AddProperty(Property.property[1]));
        },
        tooltip: 'Add property',
        child: const Icon(Icons.add),
      ),
    );
  }
}
