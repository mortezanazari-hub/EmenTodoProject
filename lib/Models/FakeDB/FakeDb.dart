import 'package:todoproject/Constant.dart';
import 'package:todoproject/Models/SimpleToDoModel.dart';

class Fakedb {
  static List<SimpleTodoModel> simpleTodoList = [
    SimpleTodoModel(
        id: 01,
        title: "Prepare Wireframe for Main Flow",
        date: MyConst.now,
        haveTimeDuration: false,
        isChecked: true,
        priority: Priority.high),
    SimpleTodoModel(
        id: 02,
        title: "Prepare Screens",
        date: MyConst.now,
        haveTimeDuration: false,
        isChecked: false,
        priority: Priority.low),
    SimpleTodoModel(
        id: 03,
        title: "Mobile App Research",
        date: MyConst.now,
        haveTimeDuration: false,
        isChecked: true,
        priority: Priority.medium),
    SimpleTodoModel(
        id: 04,
        title: "Website Research",
        date: MyConst.tommorow,
        haveTimeDuration: false,
        isChecked: false,
        priority: Priority.low),
    SimpleTodoModel(
        id: 05,
        title: "Prepare Wireframe for Main Site Flow",
        date: MyConst.tommorow,
        haveTimeDuration: false,
        isChecked: false,
        priority: Priority.high),
    SimpleTodoModel(
        id: 06,
        title: "Prepare Site Screens",
        date: MyConst.tommorow,
        haveTimeDuration: false,
        isChecked: false,
        priority: Priority.medium),
  ];
}
