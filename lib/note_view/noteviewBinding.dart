
import 'package:crud/note_view/noteViewController.dart';
import 'package:get/get.dart';

class Noteviewbinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>Noteviewcontroller());
  }
}