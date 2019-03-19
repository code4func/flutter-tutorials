import 'dart:async';

class MyBloc {
  int counter = 0;
  StreamController _counterController = new StreamController<int>.broadcast();
  Stream get counterStream =>
      _counterController.stream.transform(_counterTransformer);

  var _counterTransformer =
      StreamTransformer<int, int>.fromHandlers(handleData: (data, sink) {
    data += 10;
    sink.add(data);
  });

  void increment() {
    counter += 1;
    _counterController.sink.add(counter);
  }

  void dispose() {
    _counterController.close();
  }
}
