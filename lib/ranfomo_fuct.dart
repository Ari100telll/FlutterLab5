import 'package:bloc_example/counter_bloc/Breadsbloc.dart';
import 'package:bloc_example/counter_bloc/Factblock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CatFuct extends StatefulWidget {
  const CatFuct({Key? key}) : super(key: key);

  @override
  _CatFuctState createState() => _CatFuctState();
}

class _CatFuctState extends State<CatFuct> {
  FuctBloc factBloc = FuctBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Flutter Counter Bloc Example',
      )),
      body: Container(
        child: StreamBuilder(
            stream: factBloc.pressedCount,
            builder: (context, snapshot) {
              return ListTile(
                title: Text(
                  '${snapshot.data}'.toString(),
                ),
              );
            }),
      ),
      floatingActionButton: Container(
        width: 100.0,
        height: 100.0,
        child: FloatingActionButton(
          onPressed: () {
            factBloc.getBreeds.add(null);
          },
          tooltip: 'Increment',
          child: Text(
            "Next fact",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
