import 'dart:io';
import 'dart:async';

void main() {
  performTasks();
}

Future<void> performTasks() async {
  task1();
  String task2Data = await task2();
  task4(task2Data);
  String task3Data = await task3();
  task5(task3Data);
}

void task1() {
  print('Task 1 complete');
}

Future<String> task2() async {
  var fiveSeconds = Duration(seconds: 5);
  String result = "";
  await Future.delayed(fiveSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

Future<String> task3() async {
  var fiveSeconds = Duration(seconds: 5);
  String result = "";
  await Future.delayed(fiveSeconds, () {
    result = 'task 3 data';
    print('Task 3 complete');
  });
  return result;
}

void task4(String task2Data) {
  String result = 'task 4 data';
  print('Task 4 complete with $task2Data');
}

void task5(String task3Data) {
  String result = 'task 5 data';
  print('Task 5 complete with $task3Data');
}




//task 4 chay sau khi task 2 ket thuc
//task 5 chay sau khi task 3 ket thuc