import 'package:flutter/material.dart';
import 'package:flutter_sqlite/infrastructure/sqflite_teacher_repository.dart';
import 'package:flutter_sqlite/infrastructure/database_migration.dart';
import 'package:flutter_sqlite/model/teacher.dart';
import 'package:flutter_sqlite/pages/teacher_detail_page.dart';

class TeacherListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TeacherListWidgetState();
}


class TeacherListWidgetState extends State<TeacherListWidget> {
  SqfliteTeacherRepository docenteRepository =
      SqfliteTeacherRepository(DatabaseMigration.get);
  List<Teacher> docentes;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (docentes == null) {
      docentes = List<Teacher>();
      getData();
    }
    return Scaffold(
      body: docenteListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail(Teacher(''));
        },
        tooltip: "Add new Docente",
        child: new Icon(Icons.add),
      ),
    );
  }
  ListView docenteListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: getColor(this.docentes[position].id),
              child: Text(this.docentes[position].id.toString()),
            ),
            title: Text(this.docentes[position].firstname),
              subtitle: Text('Credits: ' +
                this.docentes[position].id.toString()
            ),
            onTap: () {
              debugPrint("Tapped on " + this.docentes[position].id.toString());
              navigateToDetail(this.docentes[position]);
            },
          ),
        );
      },
    );
  }

  void getData() {
    print('Main Thread getData');
    final docentesFuture = docenteRepository.getList();
    print('Main Thread getList ' + docentesFuture.toString());
    docentesFuture.then((docenteList) {
      print('Main Thread getList .then');
      setState(() {
        docentes = docenteList;
        count = docenteList.length;
      });
      debugPrint("Main Thread - Items: " + count.toString());
    });
  }

  Color getColor(int semester) {
    switch (semester) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.orange;
        break;
      case 3:
        return Colors.yellow;
        break;
      case 4:
        return Colors.green;
        break;
      default:
        return Colors.green;
    }
  }

  void navigateToDetail(Teacher docente) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TeacherDetailPage(docente)),
    );
    if (result == true) {
      getData();
    }
  }
}
