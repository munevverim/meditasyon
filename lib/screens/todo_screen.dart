import 'package:flutter/material.dart';

class ToDoItem {
  String title;
  bool isCompleted;

  ToDoItem({required this.title, this.isCompleted = false});
}

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<ToDoItem> _toDoItems = [
    ToDoItem(title: 'Meditasyon'),
    ToDoItem(title: '20 Sayfa kitap okuma'),
    ToDoItem(title: '1.5 litre su içmek'),
    ToDoItem(title: '30 dakika yürüyüş', isCompleted: true),
    ToDoItem(title: '10 İngilizce kelime ezberleme', isCompleted: true),
  ];

  final TextEditingController _textController = TextEditingController();

  void _addToDoItem() {
    setState(() {
      _toDoItems.add(ToDoItem(title: _textController.text));
      _textController.clear();
    });
    Navigator.of(context).pop();
  }

  void _showAddToDoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Yeni Etkinlik Ekle'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(labelText: 'Etkinlik Adı'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('İptal'),
            ),
            ElevatedButton(
              onPressed: _addToDoItem,
              child: Text('Ekle'),
            ),
          ],
        );
      },
    );
  }

  void _editToDoItem(int index) {
    _textController.text = _toDoItems[index].title;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Etkinliği Düzenle'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(labelText: 'Etkinlik Adı'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('İptal'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _toDoItems[index].title = _textController.text;
                  _textController.clear();
                });
                Navigator.of(context).pop();
              },
              child: Text('Kaydet'),
            ),
          ],
        );
      },
    );
  }

  void _deleteToDoItem(int index) {
    setState(() {
      _toDoItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Günlük Yapılacaklar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: _showAddToDoDialog,
            child: Text(
              '+ Ekle',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _toDoItems.length,
        itemBuilder: (context, index) {
          final toDoItem = _toDoItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(
                toDoItem.title,
                style: TextStyle(
                  decoration: toDoItem.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: Wrap(
                spacing: 8, // space between two icons
                children: [
                  IconButton(
                    icon: Icon(
                      toDoItem.isCompleted
                          ? Icons.check_circle
                          : Icons.circle_outlined,
                      color: toDoItem.isCompleted ? Colors.green : null,
                    ),
                    onPressed: () {
                      setState(() {
                        toDoItem.isCompleted = !toDoItem.isCompleted;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _editToDoItem(index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteToDoItem(index),
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
