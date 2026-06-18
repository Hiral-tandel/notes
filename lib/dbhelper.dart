import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();

  static final String TABLE_NOTE = "note";
  static final String NOTE_SNO = "s_no";
  static final String TITLE = "title";
  static final String DESC = 'description';
  static final String DATE = 'date_time';

  Database? myDB;
  //db open (open if exits else craete db)
  Future<Database> getDB() async {
    myDB ??= await openDB();
    return myDB!;
    // if (myDB != null) {
    //   return myDB!;
    // } else {
    //   myDB = await openDB();
    //   return myDB!;
    // }
  }

  Future<Database> openDB() async {
    Directory dirPath = await getApplicationDocumentsDirectory();
    String dbPath = join(dirPath.path, "note.db");
    return await openDatabase(
      dbPath,
      onCreate: (db, version) async {
        //create all table here
        await db.execute(
          'create table $TABLE_NOTE('
          '$NOTE_SNO integer primary key autoincrement, '
          '$TITLE text, '
          '$DESC text,'
          '$DATE text'
          ')',
        );
      },
      version: 1,
    );
  }

  //insert
  Future<bool> addNote({
    required String mTitle,
    required String mDesc,
    required String date,
  }) async {
    var db = await getDB();
    int rowsEffected = await db.insert(TABLE_NOTE, {
      TITLE: mTitle,
      DESC: mDesc,
      DATE: date,
    });
    return rowsEffected > 0;
  }

  //
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB();
    List<Map<String, dynamic>> mData = await db.query(TABLE_NOTE);
    return mData;
  }

  Future<List<Map<String, dynamic>>> searchTitle(String seachTerms) async {
    var db = await getDB();
    List<Map<String, dynamic>> mData = await db.query(
      TABLE_NOTE,
      where: '$TITLE LIKE ?',
      whereArgs: ['%$seachTerms'],
    );
    return mData;
  }

  Future<List<Map<String, dynamic>>> getOneNote(int id) async {
    var db = await getDB();
    List<Map<String, dynamic>> mData = await db.query(
      TABLE_NOTE,
      where: '$NOTE_SNO=?',
      whereArgs: [id],
    );
    return mData;
  }

  // update
  Future<bool> updateNote({
    required int id,
    required String mTitle,
    required String mDesc,
    required String date,
  }) async {
    final db = await getDB();
    final rowsEffected = await db.update(
      TABLE_NOTE,
      {
        TITLE: mTitle,
        DESC: mDesc,
        DATE: date,
      },
      where: '$NOTE_SNO=?',
      whereArgs: [id],
    );
    return rowsEffected > 0;
  }

  // delete
  Future<bool> deleteNote({required int id}) async {
    final db = await getDB();
    final rowsEffected = await db.delete(
      TABLE_NOTE,
      where: '$NOTE_SNO=?',
      whereArgs: [id],
    );
    return rowsEffected > 0;
  }
}
