import 'package:crud/add_note/addNoteController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNote extends GetView<Addnotecontroller> {
  AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.check),
              onPressed: () async {
                controller.AddNote();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.white,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                controller: controller.titleController,
                style: TextStyle(fontSize: 26),
                decoration: InputDecoration(
                  hint: Text(
                    'Title',
                    style: TextStyle(color: Colors.grey, fontSize: 26),
                  ),
                  border: InputBorder.none,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${controller.dateTime}',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
              TextField(
                controller: controller.descController,
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
