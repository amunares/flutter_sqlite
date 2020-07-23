import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_sqlite/common/app_constants.dart';
import 'package:flutter_sqlite/pages/course_list_widget.dart';
import 'package:flutter_sqlite/pages/teacher_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  Widget content = CourseListWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          brightness: Brightness.dark,
          centerTitle: true,
          title: Text(
            AppConstants.appBarTitle,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(FontAwesomeIcons.bars),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: <Widget>[
            InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(FontAwesomeIcons.solidBell,
                    size: 25, color: Colors.white),
              ),
              onTap: () {
                print("INBOX!");
              },
            ),
          ],
        ),
      ),
      body: content,
      bottomNavigationBar: _indexBottom(),
    );
  }

  Widget _indexBottom() => BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.book),
            title: Text('Cursos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userTie),
            title: Text('Docentes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userGraduate),
            title: Text('Estudiantes'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (_currentIndex) {
              case 0:
                content = CourseListWidget();
                break;
              case 1:
                content = TeacherListWidget();

              //  content = Container(
              //    alignment: Alignment.center,
              //    child: Text("Docentes"),
              //  );
                break;
              case 2:
                content = Container(
                  alignment: Alignment.center,
                  child: Text("Estudiantes"),
                );
                break;
            }
          });
        },
      );
}
