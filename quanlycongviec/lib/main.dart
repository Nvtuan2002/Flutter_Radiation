import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Task {
  final String name;
  final String description;
  final DateTime deadline;

  Task({required this.name, required this.description, required this.deadline});
}

class MyApp extends StatelessWidget {
  final List<Task> tasks = [
    Task(name: 'Task 1', description: 'Description of task 1', deadline: DateTime.now().add(Duration(days: 1))),
    Task(name: 'Task 2', description: 'Description of task 2', deadline: DateTime.now().add(Duration(days: 2))),
    Task(name: 'Task 3', description: 'Description of task 3', deadline: DateTime.now().subtract(Duration(days: 1))),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Task Manager'),
        ),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            final isOverdue = task.deadline.isBefore(DateTime.now());
            final tileColor = isOverdue ? Colors.red : Colors.white;

            return ListTile(
              title: Text(task.name),
              subtitle: Text(task.description),
              trailing: Text('Deadline: ${task.deadline}'),
              tileColor: tileColor,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
      onPressed: () async {
        final newTask = await showDialog<Task>(
          context: context,
          builder: (context) => NewTaskDialog(),
        );

        if (newTask != null) {
          setState(() {
            tasks.add(newTask);
          });
        }
      },
    ),
  ),
);
}
}

class NewTaskDialog extends StatefulWidget {
@override
_NewTaskDialogState createState() => _NewTaskDialogState();
}

class _NewTaskDialogState extends State<NewTaskDialog> {
final _formKey = GlobalKey<FormState>();
late TextEditingController _nameController;
late TextEditingController _descriptionController;
late DateTime _deadline;

@override
void initState() {
super.initState();
_nameController = TextEditingController();
_descriptionController = TextEditingController();
_deadline = DateTime.now();
}

@override
void dispose() {
_nameController.dispose();
_descriptionController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return AlertDialog(
title: Text('New Task'),
content: Form(
key: _formKey,
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
TextFormField(
controller: _nameController,
validator: (value) {
if (value == null || value.isEmpty) {
return 'Please enter a name for the task';
}
return null;
},
decoration: InputDecoration(
labelText: 'Name',
),
),
TextFormField(
controller: _descriptionController,
validator: (value) {
if (value == null || value.isEmpty) {
return 'Please enter a description for the task';
}
return null;
},
decoration: InputDecoration(
labelText: 'Description',
),
),
SizedBox(height: 16),
Text('Deadline:'),
TextButton(
onPressed: () async {
final pickedDate = await showDatePicker(
context: context,
initialDate: _deadline,
firstDate: DateTime.now(),
lastDate: DateTime.now().add(Duration(days: 365)),
);
        
