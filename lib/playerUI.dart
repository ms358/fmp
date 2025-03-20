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
    return DraggableScrollableSheet(
      initialChildSize: 0.9, // Initially takes up 90% of the screen
      minChildSize: 0.5, // Minimum size when collapsed (50% of screen)
      maxChildSize: 0.95, // Maximum size (95% of screen)
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                // Handle for dragging
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: const Center(
                    // placeholder
                    child: Icon(Icons.music_note, size: 120),
                  ),
                ),
                // Rest of your existing player content
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
        );
      },
    );
  }
}
