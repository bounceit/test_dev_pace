import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [MyHomePage()],
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController scroll = ScrollController();
  final List<String> items = [];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        scroll.animateTo(MediaQuery.of(context).size.height,
            duration: Duration(milliseconds: 500), curve: Curves.bounceInOut);
        items.add('Item${index++}');
        setState(() {});
      }),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CustomScrollView(
            controller: scroll,
            clipBehavior: Clip.hardEdge,
            slivers: [
              SliverAppBar(
                // pinned: true,
                // scrolledUnderElevation:
                //     MediaQuery.of(context).size.height * 0.8,
//  titleSpacing: height * 0.4,
                // floating: true,
                // elevation: 0.0,
                // forceElevated: true,
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.height,
                flexibleSpace: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      decoration: BoxDecoration(border: Border.all()),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(items[index]),
                      ),
                    );
                  },
                  childCount: items.length,
                ),
              ),
            ]),
      ),
    );
  }
}
