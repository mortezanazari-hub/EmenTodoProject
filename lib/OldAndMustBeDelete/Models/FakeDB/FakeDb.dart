import 'package:todoproject/OldAndMustBeDelete/Models/SimpleToDoModel.dart';

import '../../Constant.dart';

class Fakedb {
  static List<SimpleToDoModel> simpleTodoList = [
    SimpleToDoModel(
        id: 01,
        title: "Prepare Wireframe for Main Flow",
        date: MyConst.now,
        haveTimeDuration: false,
        isChecked: true,
        priority: Priority.high),
    SimpleToDoModel(
        id: 02,
        title: "Prepare Screens",
        date: MyConst.now,
        haveTimeDuration: false,
        isChecked: false,
        priority: Priority.low),
    SimpleToDoModel(
        id: 03,
        title: "Mobile App Research",
        date: MyConst.now,
        haveTimeDuration: false,
        isChecked: true,
        priority: Priority.medium),
    SimpleToDoModel(
        id: 04,
        title: "Website Research",
        date: MyConst.tommorow,
        haveTimeDuration: false,
        isChecked: false,
        priority: Priority.low),
    SimpleToDoModel(
        id: 05,
        title: "Prepare Wireframe for Main Site Flow",
        date: MyConst.tommorow,
        haveTimeDuration: false,
        isChecked: false,
        priority: Priority.high),
    SimpleToDoModel(
        id: 06,
        title: "Prepare Site Screens",
        date: MyConst.tommorow,
        haveTimeDuration: false,
        isChecked: false,
        priority: Priority.medium),
  ];
}
