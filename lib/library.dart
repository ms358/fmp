import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Library')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Library',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String? selectedDirectory =
                    await FilePicker.platform.getDirectoryPath();
                if (selectedDirectory != null) {
                  // Handle the selected directory
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Selected Directory: $selectedDirectory'),
                    ),
                  );
                } else {
                  // User canceled the picker
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No directory selected')),
                  );
                }
              },
              child: const Text('Choose a folder'),
            ),
          ],
        ),
      ),
    );
  }
}
