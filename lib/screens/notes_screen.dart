import 'package:flutter/material.dart';

class Note {
  String title;
  String content;
  DateTime date;

  Note({
    required this.title,
    required this.content,
    required this.date,
  });
}

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Note> _notes = [];

  void _addNote(Note note) {
    setState(() {
      _notes.add(note);
    });
  }

  void _editNote(Note note, int index) {
    setState(() {
      _notes[index] = note;
    });
  }

  void _deleteNoteConfirm(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Notu silmek istiyor musunuz?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Hayır'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _notes.removeAt(index);
              });
              Navigator.of(context).pop();
            },
            child: Text('Evet'),
          ),
        ],
      ),
    );
  }

  void _showAddEditNoteDialog({Note? note, int? index}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditNoteScreen(
          note: note,
        ),
      ),
    );

    if (result != null && result is Note) {
      if (index != null) {
        _editNote(result, index);
      } else {
        _addNote(result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notlar'),
        actions: [
          TextButton(
            onPressed: () => _showAddEditNoteDialog(),
            child: Text(
              '+ Yeni Not Ekle',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        ],
      ),
      body: _notes.isEmpty
          ? Center(child: Text('Henüz not eklenmedi.', style: TextStyle(color: Colors.grey, fontSize: 18)))
          : ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                final note = _notes[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(note.content),
                        SizedBox(height: 4),
                        Text(
                          '${note.date.day.toString().padLeft(2, '0')}.${note.date.month.toString().padLeft(2, '0')}.${note.date.year}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.red),
                          onPressed: () => _showAddEditNoteDialog(note: note, index: index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteNoteConfirm(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;

  AddEditNoteScreen({this.note});

  @override
  _AddEditNoteScreenState createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
  }

  void _saveNote() {
    final title = _titleController.text;
    final content = _contentController.text;

    if (title.isNotEmpty) {
      final note = Note(
        title: title,
        content: content,
        date: widget.note?.date ?? DateTime.now(),
      );
      Navigator.of(context).pop(note);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Yeni Not Ekle' : 'Notu Düzenle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Not Başlığı', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Başlık girin',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Not İçeriği', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'İçerik girin',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveNote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Kaydet', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
