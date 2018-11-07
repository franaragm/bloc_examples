import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'app_bloc_provider.dart';

class IncrementBloc implements BlocBase {
  int _counter;

  // Output backed by BehaviorSubject, which is a kind of StreamController that
  // has memory of the latest value, so it gives the value as soon as you listen
  // to it. StreamController, on the other hand, only gives the value when
  // it's changed. BehaviorSubject requires the rxdart package.
  Stream<String> get clicksCounter => _clicksCounterSubject.stream;
  final _clicksCounterSubject = BehaviorSubject<String>();

  // Input stream that can be accessed externally that uses StreamController.
  Sink<int> get addToCounter => _addToCounterController.sink;
  final _addToCounterController = StreamController<int>();

  // On the constructor we initialize the variables and start to listen to
  // changes on the sink. Everytime a change is made, it executes _handle.
  IncrementBloc() {
    _counter = 0;
    _addToCounterController.stream.listen(_handle);
  }

  // Does what ever business logic is needed and adds it to the stream subject
  // so in the UI a StreamBuilder can pickup the update. Notice that a good
  // practice is to send the data already formated. In this case the UI shows
  // a Text Widget which needs a String, so the int is converted to String.
  void _handle(data) {
    _counter++;
    _clicksCounterSubject.add(_counter.toString());
  }

  // A needed function for a StreamController, it closes the stream.
  // It is a good practice to dispose the stream when it is no longer needed.
  // This example does not make use of the dispose.
  void dispose() {
    _addToCounterController.close();
  }
}
