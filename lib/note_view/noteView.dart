import 'package:crud/note_view/noteViewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Noteview extends GetView<Noteviewcontroller> {
  const Noteview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await controller.onSaveUpdate();
            },
            icon: const Icon(Icons.check),
          ),
          IconButton(
            onPressed: () async {
              await controller.onDeleteNote();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.white,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                controller: controller.titleController.value,
                style: const TextStyle(fontSize: 26),
                decoration: const InputDecoration(
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
                decoration: const InputDecoration(
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

