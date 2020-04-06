import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo/todo.dart';

class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String TABLE = 'TodoTABLE';
  static const String DB_NAME = 'todo.db';

//Check of whether the database is not or not if the database is empty intialize the database
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

//Function for initialization of database
  initDb() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, '$DB_NAME');
    var db = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return db;
  }

//Creating a database
  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE($ID INTEGER PRIMARY KEY,$NAME TEXT)");
  }

//Inserting an item into the database
  Future<TodoItem> save(TodoItem todoitem) async {
    // Get a reference to the database
    final dbClient = await db;
    todoitem.id = await dbClient.insert(TABLE, todoitem.toMap());
    return todoitem;
  }

//Retrieve the todo items from the database
  Future<List<TodoItem>> getTodoItem() async {
    final dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, NAME]);
    List<TodoItem> todoitems = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        todoitems.add(TodoItem.fromMap(maps[i]));
      }
    }
    return todoitems;
  }

//Delete the todo items
  Future<int> deleteTodoItem(int id) async {
    final dbClient = await db;

    // Use a `where` clause to delete a specific todoitem.
    //Pass the TodoItem's id as a whereArg to prevent SQL injection.

    return await dbClient.delete(TABLE, where: '$ID=?', whereArgs: [id]);
  }

  Future<int> update(TodoItem todoitem) async {
    final dbClient = await db;
    return await dbClient.update(TABLE, todoitem.toMap(),
        where: '$ID=?', whereArgs: [todoitem.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
