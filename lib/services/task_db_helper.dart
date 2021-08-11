import 'dart:async';
import 'dart:io';

import 'package:crop_planning_techm/Models/TaskModels/task_model.dart';
import 'package:crop_planning_techm/Models/UserDataModels/crop_data.dart';
import 'package:crop_planning_techm/Models/UserDataModels/farm_data.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TaskDBHelper {
  static final _databaseName = "TaskDb.db";
  static final _databaseVersion = 1;

  static final table = 'taskTable';
  static final table2 = 'farmTable';
  static final table3 = 'cropTable';

  TaskDBHelper._privateConstructor();
  static final TaskDBHelper instance = TaskDBHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    try {
      return await openDatabase(
          //open the database or create a database if there isn't any
          path,
          version: _databaseVersion,
          onCreate: _onCreate);
    } catch (err) {
      print("Some error occured" + err);
    }
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
          taskID INTEGER PRIMARY KEY AUTOINCREMENT,
          mainTask TEXT,
          subTask TEXT, 
          startDate STRING,
          startTime STRING, 
          endDate STRING,
          endTime STRING,
          priority STRING,
          selectedCropID INTEGER, 
          taskColor INTEGER, 
          taskStatus STRING)
          ''');
    await db.execute('''
          CREATE TABLE $table2 (
          farmID INTEGER PRIMARY KEY AUTOINCREMENT,
          farmName TEXT,
          farmSize INTEGER
    )''');

    await db.execute('''
          CREATE TABLE $table3 (
          cropID INTEGER PRIMARY KEY AUTOINCREMENT,
          cropName TEXT,
          farmSelected TEXT,
          farmSizeSelected INTEGER,
          sowingDate STRING
    )
    ''');
  }

  Future<int> insertTask(TaskModel task) async {
    final db = await instance.database;
    print("insert function called"); //open database

    return db.insert(
      table, task.toMap(), //toMap()
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<List<TaskModel>> fetchTask() async {
    print("query function called");
    final db = await instance.database;
    final maps = await db.query(table);

    return List.generate(maps.length, (i) {
      return TaskModel.fromJson(maps[i]);
    });
  }

  Future<List<TaskModel>> fetchTodaysTask(String currentDate) async {
    print("Fetching Todays Task");
    final db = await instance.database;
    final todayTask = await db.rawQuery('''
    SELECT * FROM $table
    WHERE startDate = ?
    ''', [currentDate]);
    return List.generate(
        todayTask.length, (i) => TaskModel.fromJson(todayTask[i]));
  }

  Future<int> insertFarm(FarmModel data) async {
    final db = await instance.database;
    print("insert function call in Farm");

    return db.insert(
      table2,
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<FarmModel>> fetchFarms() async {
    print("query function called for farms");
    final db = await instance.database;
    final maps = await db.query(table2);

    return List.generate(maps.length, (i) {
      return FarmModel.fromMap(maps[i]);
    });
  }

  Future<int> insertCrops(CropModel cropData) async {
    final db = await instance.database;
    print("Crops entered in crop table");

    return db.insert(table3, cropData.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<List<CropModel>> fetchCrops() async {
    print("query function called for Crops");
    final db = await instance.database;
    final maps = await db.query(table3);

    return List.generate(maps.length, (i) {
      return CropModel.fromMap(maps[i]);
    });
  }

  Future<int> updateFarmSize(String farmName, int farmSize) async {
    print("Farm size updated");
    final db = await instance.database;
    final newFarmSize = await db.rawUpdate('''
    UPDATE $table2   
    SET farmSize = ?
    WHERE farmName = ?
    ''', [farmSize, farmName]);
    return newFarmSize;
  }

  Future<List<TaskModel>> fetchTasksOfCrop(
      int cropID, String currentDate) async {
    final db = await instance.database;
    final taskForCrop = await db.rawQuery('''
    SELECT * FROM $table WHERE selectedCropID = ? AND startDate = ?
    ''', [cropID, currentDate]);

    return List.generate(
        taskForCrop.length, (i) => TaskModel.fromJson(taskForCrop[i]));
  }
}
