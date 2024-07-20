import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../Constant.dart';
import '../MyWidget.dart';
import '../Widgets/todoListModel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  //final _longPressNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConst.back_Black_Color,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 75, left: 20, right: 20),
          child: SingleChildScrollView(
            //physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const TitleWithAvatar(),
                const SearchBar(),
                TitleWithLink(
                  title: "Progress",
                  onPressed: () {},
                ),
                const DailyTask(),
                TitleWithLink(title: "Today's Task", onPressed: () {}),
                TodoListModel(dateTime: MyConst.now),
                const SizedBox(
                  height: 10,
                ),
                TitleWithLink(title: "Tommorow Task", onPressed: () {}),
                TodoListModel(dateTime: MyConst.tommorow),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
