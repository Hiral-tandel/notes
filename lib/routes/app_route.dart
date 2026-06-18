import 'package:crud/add_note/addNote.dart';
import 'package:crud/add_note/noteBinding.dart';
import 'package:crud/home/homeBinding.dart';
import 'package:crud/home/home_screen.dart';
import 'package:crud/note_view/noteView.dart';
import 'package:crud/note_view/noteviewBinding.dart';
import 'package:crud/routes/route_name.dart';
import 'package:crud/search/searchBinding.dart';
import 'package:crud/search/search_view.dart';
import 'package:get/get.dart';


class AppRoute {
  AppRoute._();

  static appRoutes() => [
    GetPage(name: RouteName.HOME, page: ()=>Home(),binding: Homebinding()),
    GetPage(name: '${RouteName.ADDNOTE}/:id', page: ()=>AddNote(),binding: Notebinding()),
    GetPage(
      name: '${RouteName.NOTE}/:id',
      page: () => Noteview(),
      binding: Noteviewbinding(),
    ),
    GetPage(name: RouteName.SEARCH, page: ()=>SearchView(),binding: Searchbinding()),

  ];
}