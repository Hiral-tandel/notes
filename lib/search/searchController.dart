import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dbhelper.dart';

class Searchcontroller extends GetxController{

  TextEditingController searchController=TextEditingController();

  DBHelper? dbRef;
  RxList<dynamic> allNotes = [].obs;
  void getNotes() async {
    final notes = await dbRef!.searchTitle(searchController.text);
    allNotes.assignAll(notes);
  }
}