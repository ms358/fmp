import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Library')),
      body: Center(
        child: Text(
          'Your Library',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
