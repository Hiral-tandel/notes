import 'package:get/get.dart';

import 'homeController.dart';

class Homebinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>Homecontroller());
  }

}