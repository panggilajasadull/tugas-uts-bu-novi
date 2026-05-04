import 'package:flutter/material.dart';

class NestedWidgetPage extends StatelessWidget {
  const NestedWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Bertingkat'),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/Lowongan kerja.jpeg',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'Ini adalah fitur lowongan kerja',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
