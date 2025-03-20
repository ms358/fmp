import 'package:flutter/material.dart';

class MusicPlayer extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggleExpansion;

  const MusicPlayer({
    super.key,
    required this.isExpanded,
    required this.onToggleExpansion,
  });

  @override
  Widget build(BuildContext context) {
    return isExpanded
        ? _buildExpandedPlayer(context)
        : _buildMinimizedPlayer(context);
  }

  Widget _buildMinimizedPlayer(BuildContext context) {
    return GestureDetector(
      onTap: onToggleExpansion,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Now Playing: Song Title'),
            Row(
              children: const [
                Icon(Icons.skip_previous),
                SizedBox(width: 8),
                Icon(Icons.play_arrow),
                SizedBox(width: 8),
                Icon(Icons.skip_next),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedPlayer(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! > 300) {
          onToggleExpansion();
        }
      },
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onPressed: onToggleExpansion,
                    ),
                    const Text(
                      'Now Playing',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Center(
                  // placeholder
                  child: Icon(Icons.music_note, size: 120),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text(
                      'Song Title',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Artist Name', style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 24),
                    // Progress bar
                    Slider(value: 0.4, onChanged: (value) {}),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [Text('1:24'), Text('3:45')],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Playback controls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.shuffle),
                          onPressed: () {},
                          iconSize: 30,
                        ),
                        IconButton(
                          icon: const Icon(Icons.skip_previous),
                          onPressed: () {},
                          iconSize: 40,
                        ),
                        IconButton(
                          icon: const Icon(Icons.play_circle_filled),
                          onPressed: () {},
                          iconSize: 60,
                        ),
                        IconButton(
                          icon: const Icon(Icons.skip_next),
                          onPressed: () {},
                          iconSize: 40,
                        ),
                        IconButton(
                          icon: const Icon(Icons.repeat),
                          onPressed: () {},
                          iconSize: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
