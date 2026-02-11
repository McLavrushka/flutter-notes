import 'package:flutter/material.dart';
import 'package:flutter_notes/state/notes_view_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = context.watch<NotesViewModel>().notes;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Заметки'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          
          },
          child: Icon(Icons.add),
        ),
        body: notes.isEmpty
            ? Center(
                child: Text('Пусто. Нажмите + чтобы добавить заметку'),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Text(notes[index].title),
                        Text(notes[index].description ?? '')
                      ],
                    ),
                  );
                },
                itemCount: notes.length,
              ));
  }
}
