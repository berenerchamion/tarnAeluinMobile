import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        bottomOpacity: 0.5,
        title: const Text('Tarn Aeluin Posts'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}