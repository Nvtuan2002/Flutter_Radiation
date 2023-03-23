import 'package:flutter/material.dart';
import 'my_button.dart';

class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  // ignore: prefer_typing_uninitialized_variables
  final selectDate;
  VoidCallback onSaved;
  VoidCallback onCancel;
  VoidCallback datePicker;
  DialogBox(
      {super.key,
      required this.controller,
      required this.selectDate,
      required this.onSaved,
      required this.onCancel,
      required this.datePicker});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 250, 242, 242),
      content: SizedBox(
        height: 200,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
                icon: Icon(Icons.task),
                border: UnderlineInputBorder(),
                hintText: "Thêm nhiệm vụ mới"
                // labelText: "Thêm nhiệm vụ mới"
                ),
          ),
          TextField(
            controller: selectDate,
            onTap: () {
              datePicker();
            },
            keyboardType: TextInputType.none,
            decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
                border: UnderlineInputBorder(),
                hintText: "Thêm thời hạn"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(text: "Lưu", onPressed: onSaved),
              MyButton(text: "Hủy bỏ", onPressed: onCancel)
            ],
          )
        ]),
      ),
    );
  }
}
