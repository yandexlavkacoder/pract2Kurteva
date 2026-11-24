import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(const NotesState([]));

  int _nextId = 0;

  void addNote(String text) {
    text = text.trim();
    if (text.isEmpty) return;
    final note = Note(id: _nextId++, text: text);
    emit(NotesState([note, ...state.notes]));
  }

  void deleteNote(int id) {
    emit(NotesState(state.notes.where((note) => note.id != id).toList()));
  }

  void editNote(int id, String text) {
    text = text.trim();
    if (text.isEmpty) return;
    _update(id, (note) => note.copyWith(text: text));
  }

  void markImportant(int id) {
    _update(id, (note) => note.copyWith(isImportant: true));
  }

  void unmarkImportant(int id) {
    _update(id, (note) => note.copyWith(isImportant: false));
  }

  void _update(int id, Note Function(Note note) change) {
    emit(NotesState([
      for (final note in state.notes) note.id == id ? change(note) : note,
    ]));
  }
}
