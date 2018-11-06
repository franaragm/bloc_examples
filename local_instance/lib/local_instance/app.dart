import 'package:flutter/material.dart';
import 'app_bloc.dart';

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // This bloc is being used as a local instance in this example.
  final incrementBloc = IncrementBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC: Local Instance'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Subscribe to the output stream. Everytime it is updated, StreamBuilder
            // generates (builds) a Widget. In this case, a Text Widget. It also can
            // show an initial data.
            StreamBuilder<String>(
              // Use the output here: blocName.streamName
              stream: (incrementBloc.clicksCounter),
              initialData: '0',
              builder: (context, snapshot) => Text(
                    snapshot.data,
                    style: Theme.of(context).textTheme.display1,
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Add whatever needs to be send to the sink (nothing in this case).
        // This will make the BLoC update the stream with whatever logic is
        // implemented, so if a widget is subscribed, it will be updated.
        onPressed: () {
          // Use the input here: blocName.sinkName.add(whatever)
          incrementBloc.addToCounter.add(null);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
