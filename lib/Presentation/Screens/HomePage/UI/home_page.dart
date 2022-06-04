import 'package:api_exceptions_part2/Data/Repository/home_page_repo.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () => getData(),
        child: const Text('Fetch Data'),
      )),
    );
  }

  Future<void> getData() async {
    print('getting data');
    try {
      var response = await DemoRepo().fetchData();
      print(response);
    } catch (e) {
      print(e.toString());
    }
  }
}
