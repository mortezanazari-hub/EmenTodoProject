import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoproject/OldAndMustBeDelete/Models/FakeDB/FakeDb.dart';

import 'Models/SimpleToDoModel.dart';

class MyConst {
  static Color white_Color = const Color(0xffffffff);
  static Color white_80_Color = const Color(0xCCFFFFFF);
  static Color back_Black_Color = const Color(0xff020206);
  static Color field_Black_Color = const Color(0xff1e1e1e);
  static Color purpleColor = const Color(0xffBA83DE);

  static Color priorityHighColor = const Color(0xffFACBBA);
  static Color priorityMiddleColor = const Color(0xffD7F0FF);
  static Color priorityLowColor = const Color(0xffFAD9FF);

  //static times
  static var now =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  static var tommorow = now.add(const Duration(days: 1));

  static String formatDate(DateTime date) {
    return DateFormat('d MMM').format(date);
  }

  //db query
  static List<SimpleToDoModel> TodoListQuery(DateTime dateTime) {
    return Fakedb.simpleTodoList
        .where((todo) => todo.date == dateTime)
        .toList();
  }

  static int? longPressedIndex;
}
