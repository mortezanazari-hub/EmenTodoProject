import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:todoproject/Constant.dart';
import 'package:todoproject/Models/SimpleToDoModel.dart';



//!To do List Model
class TodoListModel extends StatelessWidget {
  late DateTime dateTime;
  late int index;
  TodoListModel({super.key, required this.index, required this.dateTime});
  Random random = new Random();

  late var _todoList = MyConst.TodoListQuery(dateTime);
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
              color: _todoList[index].priority == Priority.high
                  ? MyConst.priorityHighColor
                  : _todoList[index].priority == Priority.medium
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
                  _todoList[index].title,
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
                      DateFormat('d MMM').format(_todoList[index].date),
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
                isChecked: _todoList[index].isChecked,
                checkedColor: Color(0xffBA83DE),
                checkedWidget: Icon(Icons.check),
                border: Border.all(
                  color: _todoList[index].isChecked
                      ? Colors.black
                      : Color(0xffBA83DE),
                  width: 5,
                  strokeAlign: 0.5,
                ),
                uncheckedColor: Color.fromARGB(0, 0, 0, 0),
                size: 26.6,
                onTap: (istap) {
                  _todoList[index].isChecked = !_todoList[index].isChecked;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//!Daily Task
class DailyTask extends StatelessWidget {
  const DailyTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int totalTask = 3;
    int compeleteTask = 2;
    String progressComplete = "$compeleteTask/$totalTask";

    double progressPresent = (compeleteTask / totalTask) * 100;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
          color: MyConst.field_Black_Color,
          borderRadius: BorderRadius.circular(7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Daily Task",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                progressComplete,
                style: TextStyle(
                  color: MyConst.white_80_Color,
                  fontSize: 16,
                ),
              ),
              Text(
                "  Task Complete",
                style: TextStyle(
                    color: MyConst.white_80_Color,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                "You are almost done go ahead",
                style: TextStyle(
                    color: MyConst.white_80_Color,
                    fontSize: 14,
                    fontWeight: FontWeight.w100),
              ),
              const Spacer(),
              Text(
                "${progressPresent.toStringAsFixed(0)}%",
                style: TextStyle(
                    color: MyConst.white_80_Color,
                    fontSize: 14,
                    fontWeight: FontWeight.w100),
              )
            ],
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                backgroundBlendMode: BlendMode.multiply,
                gradient: const LinearGradient(
                  colors: [Colors.black, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: LinearProgressIndicator(
              minHeight: 18,
              value: progressPresent / 100,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: const Color.fromARGB(100, 186, 131, 222),
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(240, 186, 131, 222)),
            ),
          )
        ],
      ),
    );
  }
}

//!Title with seeAll link
class TitleWithLink extends StatelessWidget {
  late String title;
  late void Function() onPressed;

  TitleWithLink({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          TextButton(
              onPressed: onPressed,
              child: const Text(
                "SeeAll",
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
    );
  }
}

//!SearchBar
class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
          color: MyConst.field_Black_Color,
          borderRadius: BorderRadius.circular(7)),
      child: TextField(
        style: TextStyle(color: MyConst.white_Color),
        decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            hintText: "Search Task Here",
            prefixIcon: Icon(
              Icons.search,
              opticalSize: 100,
              color: MyConst.white_80_Color,
            ),
            fillColor: MyConst.white_80_Color,
            hintStyle: TextStyle(color: MyConst.white_Color)),
      ),
    );
  }
}

//!Title With Avatar widget
class TitleWithAvatar extends StatelessWidget {
  const TitleWithAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 24),
            children: const [
              TextSpan(
                  text: 'You have got 5 tasks\ntoday to complete ',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Image(
                  image: AssetImage("assets/images/pencil.png"),
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Stack(
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
              foregroundImage: AssetImage("assets/images/avatar.png"),
              child: Text('Profile Picture'),
            ),
            Positioned(
              top: 50,
              left: 40,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: const Color(0xffFF763B),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    '5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
