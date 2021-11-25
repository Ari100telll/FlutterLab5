import 'package:bloc_example/counter_bloc/Breadsbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CatsBreeds extends StatefulWidget {
  const CatsBreeds({Key? key}) : super(key: key);

  @override
  _CatsBreedsState createState() => _CatsBreedsState();
}

class _CatsBreedsState extends State<CatsBreeds> {
  BreedsBloc counterBloc = BreedsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Flutter Counter Bloc Example',
      )),
      body: Container(
        child: StreamBuilder(
            stream: counterBloc.pressedCount,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return ListView(
                children: (snapshot.data as List)
                    .map((e) => Container(
                            child: ListTile(
                          title: Text(e["breed"].toString(),),
                          trailing: Text("coat: "+ e["coat"].toString(), style: TextStyle(fontSize: 12),)
                        )))
                    .toList(),
              );
              }
              else {
                return Text("Cklick next page to see content");
              }

              // Text(
              //   "asdasd" + '${snapshot.data}',
              // );
            }),
      ),
      floatingActionButton: Container(
        width: 100.0,
        height: 100.0,
        child: FloatingActionButton(
          onPressed: () {
            counterBloc.getBreeds.add(null);
          },
          tooltip: 'Increment',
          child: Text(
            "Next Page",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

