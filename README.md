# Examples of BLoC Usage
A compilation of commented Flutter starter incrementer app examples, that uses BLoC. 

## Implementations
- [**Local Instance**](https://github.com/palancana/bloc_examples/tree/master/local_instance): This example uses a plain local instance, which can be good enough for some situations.

  ```dart
  final incrementBloc = IncrementBloc();
  ```
  
- [**Ancestor Provider as Stateful Widget**](https://github.com/palancana/bloc_examples/tree/master/ancestor_as_stateful_widget): A generic bloc provider (code by [Didier Boelens](https://www.didierboelens.com/2018/08/reactive-programming---streams---bloc/)) can instantiate any BLoC that implements the provider. It can then be accesed like:

  ```dart
  IncrementBloc incrementBloc = BlocProvider.of<IncrementBloc>(context);
  ```
  
## Acknowledgement
The examples were done thanks to the fantastic explanation from these articles:
- Filip Hracek: [Build reactive mobile apps in Flutter — companion article](https://medium.com/flutter-io/build-reactive-mobile-apps-in-flutter-companion-article-13950959e381)
- Didier Boeledi: [Reactive Programming - Streams - BLoC](https://www.didierboelens.com/2018/08/reactive-programming---streams---bloc/)
