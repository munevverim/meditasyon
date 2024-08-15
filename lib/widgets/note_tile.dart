import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final String content;
  final String date;

  NoteTile({required this.title, required this.content, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          title: Text(
            title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.0),
              Text(content, style: TextStyle(fontSize: 14.0)),
              SizedBox(height: 8.0),
              Text(date, style: TextStyle(fontSize: 12.0, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
