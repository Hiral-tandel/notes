import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Searchbinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>SearchController());
  }


}