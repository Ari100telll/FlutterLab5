import 'package:bloc_example/cats_breeds.dart';
import 'package:bloc_example/cats_facts.dart';
import 'package:bloc_example/counter_bloc/Breadsbloc.dart';
import 'package:flutter/material.dart';
import 'ranfomo_fuct.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  BreedsBloc counterBloc = BreedsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Flutter Counter Bloc Example',
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3 - 19,
              child: StreamBuilder(
                  stream: counterBloc.pressedCount,
                  builder: (context, snapshot) {
                    return ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFF3949AB)),
                      child: Text("Show cats breeds"),
                      onPressed: () => {
                        counterBloc.getBreeds.add(null),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CatsBreeds()),
                        )
                      },
                    );
                  }),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3 - 19,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xFFBA68C8)),
                child: Text("Show a random cat fact"),
                onPressed: () => {
                  counterBloc.getBreeds.add(null),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CatFuct()),
                  )
                },
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3 - 19,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xFFFFA000)),
                  child: Text("Show a list of cat facts"),
                  onPressed: () => {
                    counterBloc.getBreeds.add(null),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CatsFacts()),
                    )
                  },
                ))
          ],
        ),
      ),
    );
  }
}
