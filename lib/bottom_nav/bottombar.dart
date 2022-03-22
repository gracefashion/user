import 'package:kzn/bottom_nav/gallery.dart';
import 'package:flutter/material.dart';
import 'package:kzn/bottom_nav/vlogs.dart';
import 'package:kzn/providers/blog_provider.dart';
// import 'package:kzn/providers/vlog_provider.dart';
import 'package:kzn/ui/routes/main_route.dart';
import 'package:provider/provider.dart';
import 'blog.dart';
import 'newclass.dart';
import 'package:flutter/cupertino.dart';

// import 'newclass_enroll.dart';
import 'vlogs.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentindex = 2;

  List<Widget> _widgetOption= <Widget>[
    Blog(),
    Vlog(),
    MainRoute(),
    Gallery(),
    NewClass(),

  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<BlogProvider>(context, listen: false).fetchWpPostsForBlog();
    Provider.of<BlogProvider>(context, listen: false).fetchWpPostsForNewClass();

    // Provider.of<VlogProvider>(context, listen: false).fetchVlogList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_currentindex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Blog'),
          BottomNavigationBarItem(icon: Icon(Icons.video_label_rounded), label: 'Vlog'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Album'),
          BottomNavigationBarItem(label: 'Coming Classes',
          icon: Stack(children: <Widget>[
          Icon(Icons.doorbell),
            new Positioned(
                right: 0,
                child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                      child: new Text('New',style: new TextStyle(color: Colors.white,fontSize: 8),
                        textAlign: TextAlign.center),),),],),),],
        currentIndex: _currentindex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _changeItem,
      ),
    );
  }

  void _changeItem(int value) {
    setState(() {
      _currentindex = value;

    });
  }
}







// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   // Properties & Variables needed
//
//   int currentTab = 0; // to keep track of active tab index
//   final List<Widget> screens = [
//     MainRoute(),
//     Blog(),
//     LoginRoute(),
//   ]; // to store nested tabs
//   final PageStorageBucket bucket = PageStorageBucket();
//   Widget currentScreen = MainRoute(); // Our first view in viewport
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageStorage(
//         child: currentScreen,
//         bucket: bucket,
//       ),
//       floatingActionButton: FloatingActionButton(
//         child:
//         FaIcon(
//         FontAwesomeIcons.graduationCap),
//           backgroundColor: Colors.indigo[900],
//         onPressed: () {
//           setState(() {
//             currentScreen = MainRoute(); // if user taps on this dashboard tab will be active
//             currentTab = 0;
//           });
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 7,
//         child: Container(
//           height: 52,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: () {
//                       setState(() {
//                         currentScreen = Blog(); // if user taps on this dashboard tab will be active
//                         currentTab = 0;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         FaIcon(
//                         FontAwesomeIcons.bloggerB,
//                           color: currentTab == 0 ? Colors.indigo[900] : Colors.grey,
//                         ),
//                         Text(
//                           '  Blog',
//                           style: TextStyle(
//                             color: currentTab == 0 ? Colors.indigo[900] : Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: () {
//                       setState(() {
//                         currentScreen = Vlog(); // if user taps on this dashboard tab will be active
//                         currentTab = 1;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         FaIcon(
//                           FontAwesomeIcons.fileVideo,
//                           color: currentTab == 1 ? Colors.indigo[900] : Colors.grey,
//                         ),
//                         Text(
//                           'Video Blog',
//                           style: TextStyle(
//                             color: currentTab == 1 ? Colors.indigo[900] : Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//
//               // Right Tab bar icons
//
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: () {
//                       setState(() {
//                         currentScreen =
//                             Gallery(); // if user taps on this dashboard tab will be active
//                         currentTab = 2;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         FaIcon(
//                           FontAwesomeIcons.photoVideo,
//                           color: currentTab == 2 ? Colors.indigo[900] : Colors.grey,
//                         ),
//                         Text(
//                           "  Gallery",
//                           style: TextStyle(
//                             color: currentTab == 2 ? Colors.indigo[900] : Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: () {
//                       setState(() {
//                         currentScreen =
//                             Noti();
//
//                             // LoginRoute(); // if user taps on this dashboard tab will be active
//                         currentTab = 3;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         FaIcon(
//                           FontAwesomeIcons.solidBell,
//                           color: currentTab == 3 ? Colors.indigo[900] : Colors.grey,
//                         ),
//                         Text(
//                           'Notification',
//                           style: TextStyle(
//                             color: currentTab == 3 ? Colors.indigo[900] : Colors.grey, fontSize: 14
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               )
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
