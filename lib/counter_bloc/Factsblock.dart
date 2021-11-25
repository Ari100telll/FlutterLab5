import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class FactsBlock {
  int _page = 0;

  FactsBlock() {
    _actionController.stream.listen(_increaseStream);
  }

  final _counterStream = BehaviorSubject<List>.seeded([]);

  Stream get pressedCount => _counterStream.stream;
  Sink get _addValue => _counterStream.sink;

  StreamController _actionController = StreamController();
  StreamSink get getBreeds => _actionController.sink;
 

  void _increaseStream(data) async {
    _page+=1;
    final res = await http.get(Uri.parse('https://catfact.ninja/facts?page'+_page.toString()));
    _addValue.add(jsonDecode(res.body)["data"]);
    print(jsonDecode(res.body)["data"]);
  }


  void dispose() {
    _counterStream.close();
    _actionController.close();
  }
}