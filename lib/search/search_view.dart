import 'package:crud/search/searchController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../dbhelper.dart';
import '../routes/route_name.dart';

class SearchView extends GetView<Searchcontroller> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade700),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            controller: controller.searchController,
            decoration: InputDecoration(
              hintText: 'Search by the note title',
              icon: Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: controller.allNotes.isNotEmpty
          ? ListView.builder(
              itemCount: controller.allNotes.length,
              itemBuilder: (_, index) {
                return Obx(
                  () => InkWell(
                    onTap: () {
                      Get.toNamed(
                        '${RouteName.NOTE}/${controller.allNotes[index]}',
                      );
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
          : Center(
              child: Column(
                children: [
                  Image.asset('assets/images/img.png', width: 200, height: 200),
                  Text('Notes not found. Try searching again.'),
                ],
              ),
            ),
    );
  }
}
