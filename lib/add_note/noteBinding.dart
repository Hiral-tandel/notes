import 'package:get/get.dart';

import 'addNoteController.dart';

class Notebinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>Addnotecontroller());
  }

}