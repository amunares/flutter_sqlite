import 'package:flutter_sqlite/infrastructure/database_migration.dart';
import 'package:flutter_sqlite/model/course.dart';

abstract class CourseRepository {
  DatabaseMigration databaseMigration;
  Future<int> insert(Course course);
  Future<int> update(Course course);
  Future<int> delete(Course course);
  Future<List<Course>> getList();
}
