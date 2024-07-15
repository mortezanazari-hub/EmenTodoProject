//!To do List Model
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../Constant.dart';
import '../Models/SimpleToDoModel.dart';

class TodoListModel extends StatefulWidget {
  late DateTime dateTime;
  late int index;

  TodoListModel({super.key, required this.index, required this.dateTime});

  @override
  State<TodoListModel> createState() => _TodoListModelState();
}

class _TodoListModelState extends State<TodoListModel> {
  Random random = new Random();

  late var _todoList = MyConst.TodoListQuery(widget.dateTime);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: MyConst.field_Black_Color),
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 15,
              height: 80,
              color: _todoList[widget.index].priority == Priority.high
                  ? MyConst.priorityHighColor
                  : _todoList[widget.index].priority == Priority.medium
                      ? MyConst.priorityMiddleColor
                      : MyConst.priorityLowColor,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 13),
                Text(
                  _todoList[widget.index].title,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.edit_calendar,
                      color: MyConst.white_80_Color,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      DateFormat('d MMM').format(_todoList[widget.index].date),
                      style: TextStyle(
                          color: MyConst.white_80_Color, fontSize: 14),
                    )
                  ],
                )
              ],
            ),
            Spacer(),
            Center(
              heightFactor: 3,
              child: RoundCheckBox(
                isChecked: _todoList[widget.index].isChecked,
                checkedColor: Color(0xffBA83DE),
                checkedWidget: Icon(Icons.check),
                border: Border.all(
                  color: _todoList[widget.index].isChecked
                      ? Colors.black
                      : Color(0xffBA83DE),
                  width: 5,
                  strokeAlign: 0.5,
                ),
                uncheckedColor: Color.fromARGB(0, 0, 0, 0),
                size: 26.6,
                onTap: (istap) {
                  _todoList[widget.index].isChecked =
                      !_todoList[widget.index].isChecked;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
