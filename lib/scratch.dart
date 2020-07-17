import 'dart:io';

void main() {
  performTask();
}

void performTask() async {
  task1();
//  String task2Result = await
  print(task2());
  // task3(task2Result);
}

void task1() {
  String result = 'task 3 data';
  print('task 3 complete');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;
  // sleep(threeSeconds);
  await Future.delayed(threeSeconds);
  result = 'task 2 data';
  print('task 2 complete');
  return result;
}

void task3(String task2data) {
  String result = 'task 1 data';
  print('task 1 complete with $task2data');
}
