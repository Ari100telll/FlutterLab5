import 'package:bloc_example/counter_bloc/Factsblock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CatsFacts extends StatefulWidget {
  const CatsFacts({Key? key}) : super(key: key);

  @override
  _CatsFactsState createState() => _CatsFactsState();
}

class _CatsFactsState extends State<CatsFacts> {
  FactsBlock catsFactsBloc = FactsBlock();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Flutter Counter Bloc Example',
      )),
      body: Container(
        child: StreamBuilder(
            stream: catsFactsBloc.pressedCount,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return ListView(
                  children: (snapshot.data as List)
                      .map((e) => Container(
                              child: ListTile(
                            title: Text(
                              e["fact"].toString(),
                            ),
                          )))
                      .toList(),
                );
              } else {
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
            catsFactsBloc.getBreeds.add(null);
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
