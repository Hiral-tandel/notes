import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dbhelper.dart';

class Noteviewcontroller extends GetxController{
  Rx<TextEditingController> titleController=TextEditingController().obs;
  Rx<TextEditingController> descController=TextEditingController().obs;
  int id = int.parse(Get.parameters['id'] ?? '0');
  DBHelper? dbRef;
  RxList<dynamic> allNotes = [].obs;
  void getNotes() async {
    final notes = await dbRef!.getOneNote(id);
    allNotes.assignAll(notes);
    titleController.value=notes.first[DBHelper.TITLE];
    descController.value=allNotes.first[DBHelper.DESC];
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNotes();
  }


}