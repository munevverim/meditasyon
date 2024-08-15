import 'package:flutter/material.dart';

class Reminder {
  final String time;
  final String title;
  final String description;

  Reminder({required this.time, required this.title, required this.description});
}

class RemindersScreen extends StatefulWidget {
  @override
  _RemindersScreenState createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  List<Reminder> reminders = [];

  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _addReminder() {
    setState(() {
      reminders.add(
        Reminder(
          time: _timeController.text,
          title: _titleController.text,
          description: _descriptionController.text,
        ),
      );
    });

    _timeController.clear();
    _titleController.clear();
    _descriptionController.clear();
    Navigator.of(context).pop();
  }

  void _showAddReminderDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Yeni Hatırlatma Ekle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _timeController,
                decoration: InputDecoration(labelText: 'Saat'),
              ),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Başlık', hintText: 'Örneğin: Toplantı'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Açıklama', hintText: 'Örneğin: Proje sunumu için hazırlık'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('İptal'),
            ),
            ElevatedButton(
              onPressed: _addReminder,
              child: Text('Ekle'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hatırlatmalar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: _showAddReminderDialog,
            child: Text(
              'Hatırlatma Ekle',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: reminders.isEmpty
          ? Center(child: Text('Henüz hatırlatma eklenmedi.', style: TextStyle(color: Colors.grey, fontSize: 18)))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                final reminder = reminders[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text(reminder.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(reminder.time),
                        SizedBox(height: 8.0),
                        Text(reminder.description),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                );
              },
            ),
    );
  }
}
