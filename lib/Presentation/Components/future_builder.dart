import 'package:flutter/material.dart';

class FutureBuilderWidget extends StatelessWidget {
  const FutureBuilderWidget({Key? key, required this.futureCall})
      : super(key: key);

  final Future futureCall;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureCall,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.toString());
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Waiting....');
        } else if (snapshot.connectionState == ConnectionState.none) {
          return const Text('cannot establish connection with the server.');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
