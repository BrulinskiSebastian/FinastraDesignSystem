import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FDSTheme(
      themeData: FDSThemeData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int buttonToggleValue = 1;
  late final textEditingController = TextEditingController();
  late final textAreaEditingController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              FDSButton(
                text: 'Button Lorem Ipsum',
                type: FDSButtonType.outlined,
                color: FDSButtonColor.primary,
                size: FDSButtonSize.standard,
                onPressed: () {
                  FocusScope.of(context).focusedChild?.unfocus();
                  _incrementCounter();
                },
              ),
              const Gap(24.0),
              const FDSBadge(style: FDSBadgeStyle.secondary, text: '123'),
              const Gap(24.0),
              FDSButtonToggle(
                value: buttonToggleValue,
                size: FDSButtonToggleSize.standard,
                itemOrientation: FDSButtonToggleItemOrientation.horizontal,
                items: [
                  FDSButtonToggleItem(
                    value: 1,
                    icon: FDSAsset.icon.add,
                    // text: '1D',
                  ),
                  FDSButtonToggleItem(
                    value: 2,
                    icon: FDSAsset.icon.add,
                    badge: const FDSBadge(
                      style: FDSBadgeStyle.outlined,
                      text: '8',
                    ),
                    text: '5D',
                  ),
                  FDSButtonToggleItem(
                    icon: FDSAsset.icon.add,
                    value: 3,
                    text: '1M',
                  ),
                  FDSButtonToggleItem(value: 4, text: '1Y'),
                  FDSButtonToggleItem(value: 5, text: '5Y'),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      buttonToggleValue = value;
                    });
                  }
                },
              ),
              const Gap(24.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FDSTextField(
                  controller: textEditingController,
                  hint: 'This is hint',
                  insideLabel: 'Label',
                  hasError: true,
                  helperText: 'Helper text',
                  iconLeft: FDSAsset.icon.add,
                ),
              ),
              const Gap(24.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FDSTextArea(
                  controller: textAreaEditingController,
                  size: FDSTextFieldSize.large,
                  hint: 'This is hint',
                  insideLabel: 'Label',
                  helperText: 'Helper text',
                  iconLeft: FDSAsset.icon.add,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
