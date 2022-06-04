import '../../../../Data/Models/home_page_model.dart';

import '../../../../Data/Repository/home_page_repo.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<DemoModel> futureDemoModel;

  @override
  void initState() {
    futureDemoModel = DemoRepo().fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: futureDemoModel,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return buildDataLayout(snapshot.data as DemoModel);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Waiting....');
            } else if (snapshot.connectionState == ConnectionState.none) {
              return const Text('Cannot establish connection with the server.');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget buildDataLayout(DemoModel data) => ListTile(
        title: Text(data.userId.toString()),
        subtitle: Text(data.title),
        trailing: Text(data.completed.toString()),
      );
}
