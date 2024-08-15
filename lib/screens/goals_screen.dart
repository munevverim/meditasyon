import 'package:flutter/material.dart';

class Goal {
  String title;
  String description;

  Goal({required this.title, required this.description});
}

class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  List<Goal> _goals = [
    Goal(title: 'Vizyon', description: ''),
    Goal(title: 'Sağlık', description: ''),
    Goal(title: 'Fitness', description: '78 kiloya ulaşmak istiyorum.'),
  ];

  void _addGoal(Goal goal) {
    setState(() {
      _goals.add(goal);
    });
  }

  void _editGoal(Goal goal, int index) {
    setState(() {
      _goals[index] = goal;
    });
  }

  void _deleteGoal(int index) {
    setState(() {
      _goals.removeAt(index);
    });
  }

  void _showAddEditGoalDialog({Goal? goal, int? index}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditGoalScreen(
          goal: goal,
        ),
      ),
    );

    if (result != null && result is Goal) {
      if (index != null) {
        _editGoal(result, index);
      } else {
        _addGoal(result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hedefler'),
        actions: [
          TextButton(
            onPressed: () => _showAddEditGoalDialog(),
            child: Text(
              '+ Yeni Hedef Ekle',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _goals.length,
        itemBuilder: (context, index) {
          final goal = _goals[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(goal.title),
              subtitle: Text(goal.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.red),
                    onPressed: () => _showAddEditGoalDialog(goal: goal, index: index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteGoal(index),
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

class AddEditGoalScreen extends StatefulWidget {
  final Goal? goal;

  AddEditGoalScreen({this.goal});

  @override
  _AddEditGoalScreenState createState() => _AddEditGoalScreenState();
}

class _AddEditGoalScreenState extends State<AddEditGoalScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.goal != null) {
      _titleController.text = widget.goal!.title;
      _descriptionController.text = widget.goal!.description;
    }
  }

  void _saveGoal() {
    final title = _titleController.text;
    final description = _descriptionController.text;

    if (title.isNotEmpty) {
      final goal = Goal(title: title, description: description);
      Navigator.of(context).pop(goal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.goal == null ? 'Yeni Hedef Ekle' : 'Hedefi Düzenle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hedef Başlığı', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
            Text('Hedef Açıklaması', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Açıklama girin',
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
                onPressed: _saveGoal,
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


