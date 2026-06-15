import 'package:crud/home/homeController.dart';
import 'package:crud/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../dbhelper.dart';

class Home extends GetView<Homecontroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: (){

          }, icon: Icon(Icons.search)),
        )
      ],),
      body: controller.allNotes.isNotEmpty
          ? ListView.builder(
              itemCount: controller.allNotes.length,
              itemBuilder: (_, index) {
                return Obx(
                  () => InkWell(
                    onTap: (){
                      Get.toNamed('${RouteName.NOTE}/${controller.allNotes[index]}');
                    },
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: .start,
                        children: [
                          Text(
                            controller.allNotes[index][DBHelper.TITLE],
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            controller.allNotes[index][DBHelper.DESC],
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          Text(
                            controller.allNotes[index][DBHelper.DATE],
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(child: Column(
            children: [
              Image.asset('assets/images/empty_note.png',width: 200,height: 200,),
              Text('Create Your first Note.'),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteName.ADDNOTE);
          //Navigator.push(context, MaterialPageRoute(builder: (_) => AddNote()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
