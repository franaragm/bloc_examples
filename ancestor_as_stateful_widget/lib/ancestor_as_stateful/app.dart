import 'package:flutter/material.dart';
import 'app_bloc.dart';
import 'app_bloc_provider.dart';

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Using BlocProvider you can provide a bloc, in this case IncrementBloc.
      // The child will be the page to go later or another BlocProvider in
      // case there are multiple blocs that need to be provided.
      // Notice that the bloc is accessible only down the tree, starting
      // were you first instantiate the provider.
      home: BlocProvider<IncrementBloc>(
        bloc: IncrementBloc(),
        child: MyHomePage(),
      ),
      // An example of how to instantiate multipe blocs:
      //  home: BlocProvider<IncrementBloc>(
      //    bloc: IncrementBloc(),
      //    child: BlocProvider<AnotherBloc>(
      //      bloc: AnotherBloc(),
      //      child: MyHomePage(),
      //    ),
      //  ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This bloc is being used with an ancestor as stateful widget. This is how you
    // get access to it:
    IncrementBloc incrementBloc = BlocProvider.of<IncrementBloc>(context);
    // And when you are done using it, you can dispose it as the stateful widget of
    // the provider allows to implement this method. It is not needed here, but on
    // more complex apps it is a good practice.
    // incrementBloc.dispose();
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC: Ancestor as Stateful Widget'),
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
