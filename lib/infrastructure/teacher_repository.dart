import 'package:flutter_sqlite/infrastructure/database_migration.dart';
import 'package:flutter_sqlite/model/teacher.dart';

abstract class TeacherRepository {
  DatabaseMigration databaseMigration;
  Future<int> insert(Teacher teacher);
  Future<int> update(Teacher teacher);
  Future<int> delete(Teacher teacher);
  Future<List<Teacher>> getList();
}
