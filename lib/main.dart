import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

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

final titleProvider = Provider((ref) => 'Flutter Demo Home Page');
final countProvider = StateProvider((ref) => 0);

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Consumer(
        builder: (context, ref, child) {
          return Text(ref.read(titleProvider));
        },
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, ref, child) {
                return Text(
                  ref.watch(countProvider).state.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton:
          IncreaseButton(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class IncreaseButton extends ConsumerWidget {
  const IncreaseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    print('button rebuild');
    return FloatingActionButton(
      onPressed: () => ref.read(countProvider).state++,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
