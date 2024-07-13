import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:todoproject/Constant.dart';
import 'package:todoproject/Models/SimpleToDoModel.dart';

import '../MyWidget.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConst.back_Black_Color,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 75, left: 20, right: 20),
          child: SingleChildScrollView(
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
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, int index) {
                      return TodoListModel(
                        index: index,
                        dateTime: MyConst.now,
                      );
                    }),
                TitleWithLink(title: "Tommorow Task", onPressed: () {}),
                ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, int index) {
                      return TodoListModel(
                        index: index,
                        dateTime: MyConst.tommorow,
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
