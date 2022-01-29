import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;
  static final table = 'tbl_order';
  static final proId = 'product_id';
  static final proName = 'name';
  static final proQuantity = 'qty';
  static final proPrice = 'sale_price';
  static final totalPrice = 'amount';
  static final regularPrice = 'regular_rate';
  static final proImg = 'image_link';

  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get getDatabase async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table(
            $proId INTEGER PRIMARY KEY,
            $proName TEXT NOT NULL,
            $proQuantity INTEGER NOT NULL,
            $proPrice INTEGER NOT NULL,
            $totalPrice INTEGER NOT NULL,
            $proImg TEXT NOT NULL
          )
        ''');
  }
}
