import 'package:flutter/material.dart';

import '../cubit/notes_cubit.dart';

class NoteViewPage extends StatelessWidget {
  final Note note;

  const NoteViewPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.isImportant ? 'Важная заметка ⭐️' : 'Заметка'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SelectableText(
          note.text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
