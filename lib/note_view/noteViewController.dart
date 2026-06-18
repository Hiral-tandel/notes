import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../dbhelper.dart';

class Noteviewcontroller extends GetxController {
  final Rx<TextEditingController> titleController = TextEditingController().obs;
  final Rx<TextEditingController> descController = TextEditingController().obs;

  final int id = int.parse(Get.parameters['id'] ?? '0');
  DBHelper? dbRef;

  RxList<dynamic> allNotes = [].obs;

  String dateTime = DateFormat('dd MMM hh:mm a').format(DateTime.now());

  Future<void> getNotes() async {
    final notes = await dbRef!.getOneNote(id);
    allNotes.assignAll(notes);
    if (notes.isEmpty) return;

    titleController.value.text = notes.first[DBHelper.TITLE]?.toString() ?? '';
    descController.value.text = notes.first[DBHelper.DESC]?.toString() ?? '';
  }

  Future<void> onSaveUpdate() async {
    final title = titleController.value.text.trim();
    final desc = descController.value.text.trim();
    if (title.isEmpty || desc.isEmpty) return;

    final check = await dbRef!.updateNote(
      id: id,
      mTitle: title,
      mDesc: desc,
      date: dateTime,
    );

    if (check) {
      await getNotes();
      Get.back();
    }
  }

  Future<void> onDeleteNote() async {
    final check = await dbRef!.deleteNote(id: id);
    if (check) {
      Get.back();
    }
  }

  @override
  void onInit() {
    super.onInit();
    dbRef = DBHelper.getInstance;
    getNotes();
  }
}
