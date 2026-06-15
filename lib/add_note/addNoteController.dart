import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../dbhelper.dart';

class Addnotecontroller extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  String dateTime = DateFormat('dd MMM hh:mm a').format(DateTime.now());
  DBHelper? dbRef = DBHelper.getInstance;

  void AddNote() async {
    if (titleController.text.isNotEmpty && descController.text.isNotEmpty) {
      bool check = await dbRef!.addNote(
        mTitle: titleController.text,
        mDesc: descController.text,
        date: dateTime,
      );
      if (check) {
        debugPrint('added data');
      }
    }

  }
}
