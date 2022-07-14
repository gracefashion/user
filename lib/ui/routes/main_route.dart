import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/data/models/course.dart';
import 'package:kzn/providers/blog_provider.dart';
import 'package:kzn/providers/course_provider.dart';
import 'package:kzn/ui/components/combine/app_drawer.dart';
import 'package:kzn/ui/components/combine/course_list.dart';
import 'package:kzn/ui/components/combine/intro_slider.dart';
import 'package:kzn/utils/open_facebook.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MainRoute extends StatefulWidget {
  static const routeName = '/main_route';

  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<CourseProvider>(context, listen: false)
        .getCourseListForOneTime();





    //Provider.of<UserProvider>(context,listen: false).login(username: "admin", password: "admin");
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
            iconTheme: IconThemeData(color: Colors.pinkAccent),
            backgroundColor: Colors.white,
            title: Text("Grace Fashion & Design School",
                style: TextStyle(fontSize: 15, color: Colors.pinkAccent,
                  letterSpacing: 1,
                  wordSpacing: 1,
                )),
            actions: [

              SizedBox(
                width: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.resolveWith<double>(
                      // As you said you dont need elevation. I'm returning 0 in both case
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return 0;
                        }
                        return 0; // Defer to the widget's default.
                      },
                    ),
                  ),
                  onPressed: () async {
                    try {
                      await launch('https://m.me/Gracefashionschool');
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: FaIcon(
                    FontAwesomeIcons.facebookMessenger,
                    color: Colors.blue,
                    size: 23,
                  ),
                ),
              ),
            ]),

        body: ListView(
          children: [
            IntroSlider(
              photos: introSliderImages,
            ),
            _courseListFutureBuilder(),
          ],
        ),

        drawer: AppDrawer(),
        // floatingActionButton: AppFab(),
      ),
    );
  }

  // 1 Course List Future Builder
  Widget _courseListFutureBuilder() {
    return FutureBuilder(
        future: Provider.of<CourseProvider>(context, listen: true).courseList,
        builder: (BuildContext context, AsyncSnapshot<List<Course>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.length == 0) {
              return Container(
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [

                      Image.asset(
                        'assets/images/q.png',
                        width: 600.0,
                        height: 240.0,
                        fit: BoxFit.fitHeight,
                      ),

                      Image.asset(
                        'assets/images/qq.jpg',
                        width: 600.0,
                        height: 240.0,
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                ),),
              );
            } else {
              return CourseList(courses: snapshot.data!);
            }
          } else if (snapshot.hasError) {
            //_refreshController.refreshCompleted();
            return Container(
              child: Center(child: Text('error ${snapshot.error.toString()}')),
            );
          } else {
            //_refreshController.refreshCompleted();
            return Container(
              child: Center(child: Text('Grace Fashion & Design School')),
            );
          }
        });
  }
}
