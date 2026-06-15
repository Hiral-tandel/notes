import 'package:crud/note_view/noteViewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Noteview extends GetView<Noteviewcontroller> {
  const Noteview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.white,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                controller: controller.titleController.value,
                style: TextStyle(fontSize: 26),
                decoration: InputDecoration(
                  hint: Text(
                    'Title',
                    style: TextStyle(color: Colors.grey, fontSize: 26),
                  ),
                  border: InputBorder.none,
                ),
              ),

              TextField(
                controller: controller.descController.value,
                maxLines: null,
                decoration: InputDecoration(
                  hint: Text(
                    'Start typing ',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
