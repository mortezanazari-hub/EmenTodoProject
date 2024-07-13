import 'dart:core';
import 'package:flutter/material.dart';

class SimpleTodoModel {
  int _id;
  String _title;
  String? _description;
  DateTime _date;
  bool _haveTimeDuration;
  TimeOfDay? _startTime; // 00:00:00
  TimeOfDay? _endTime; // 00:00:00
  bool _isChecked;
  Priority _priority;

  SimpleTodoModel({
    required int id,
    required String title,
    String? description,
    required DateTime date,
    required bool haveTimeDuration,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    required bool isChecked,
    required Priority priority,
  })  : _id = id,
        _title = title,
        _description = description,
        _date = date,
        _haveTimeDuration = haveTimeDuration,
        _startTime = startTime,
        _endTime = endTime,
        _isChecked = isChecked,
        _priority = priority;

  int get id => _id;
  String get title => _title;
  String? get description => _description;
  DateTime get date => _date;
  bool get haveTimeDuration => _haveTimeDuration;
  TimeOfDay? get startTime => _startTime;
  TimeOfDay? get endTime => _endTime;
  bool get isChecked => _isChecked;
  Priority get priority => _priority;

  set id(int value) => _id = value;
  set title(String value) => _title = value;
  set description(String? value) => _description = value;
  set date(DateTime value) => _date = value;
  set haveTimeDuration(bool value) => _haveTimeDuration = value;
  set startTime(TimeOfDay? value) => _startTime = value;
  set endTime(TimeOfDay? value) => _endTime = value;
  set isChecked(bool value) => _isChecked = value;
  set priority(Priority value) => _priority = value;
}

enum Priority { low, medium, high }
