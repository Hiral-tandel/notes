import 'package:get/get.dart';

import '../dbhelper.dart';

class Homecontroller extends GetxController{
  DBHelper? dbRef;
  RxList<dynamic> allNotes = [].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dbRef = DBHelper.getInstance;
    getNotes();
  }
  void getNotes() async {
    final notes = await dbRef!.getAllNotes();
    allNotes.assignAll(notes);
  }

}