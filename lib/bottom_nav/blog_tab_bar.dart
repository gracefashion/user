// import 'package:flutter/material.dart';
// import 'package:kzn/bottom_nav/famous.dart';
// import 'package:kzn/bottom_nav/history.dart';
// import 'drawing.dart';
// import 'others.dart';
// import 'color.dart';
// import 'famous.dart';
//
// // class BlogTab extends StatefulWidget {
// //   @override
// //   _BlogTabState createState() => _BlogTabState();
// // }
// // class _BlogTabState extends State<BlogTab> {
// //   @override
// //   Widget build(BuildContext context) => DefaultTabController(
// //     length: 5,
// //     child: Scaffold(
// //       appBar: AppBar(
// //         title: const Center(child: Text(
// //           "His's and Her's Knowledge Blogs",
// //           style: TextStyle(color: Colors.black, fontSize: 16, letterSpacing: 1),
// //         )
// //         ),
// //         flexibleSpace: Container(
// //           decoration: BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [Colors.white, Colors.white],
// //               begin: Alignment.bottomRight,
// //               end: Alignment.topLeft,
// //             ),
// //           ),
// //         ),
// //         bottom: TabBar(
// //           //isScrollable: true,
// //           indicatorColor: Colors.black,
// //           labelColor: Colors.black,
// //           labelStyle: TextStyle(fontSize: 8),
// //           indicatorWeight: 5,
// //           tabs: [
// //             Tab(icon: Icon(Icons.color_lens, color: Colors.black), text: 'Color'),
// //             Tab(icon: Icon(Icons.group, color: Colors.black), text: 'Famous'),
// //             Tab(icon: Icon(Icons.create, color: Colors.black), text: 'Drawing'),
// //             Tab(icon: Icon(Icons.military_tech, color: Colors.black), text: 'History'),
// //             Tab(icon: Icon(Icons.public, color: Colors.black), text: 'Others'),
// //           ],
// //         ),
// //         // elevation: 20,
// //         titleSpacing: 10,
// //       ),
// //       body: TabBarView(
// //         children: [
// //           Color(),
// //           Famous(),
// //           Drawing(),
// //           History(),
// //           Others(),
// //         ],
// //       ),
// //     ),
// //   );
// // }
//
// class BlogTab extends StatefulWidget {
//   @override
//   _BlogTabState createState() => _BlogTabState();
// }
//
// class _BlogTabState extends State<BlogTab>
//     with SingleTickerProviderStateMixin {
//   TabController tabController;
//
//   @override
//   void initState() {
//     super.initState();
//
//     tabController = TabController(length: 5, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }
//
//   Widget getTabBar() {
//     return TabBar(controller: tabController, tabs: [
//             Tab(icon: Icon(Icons.color_lens, color: Colors.black)),
//             Tab(icon: Icon(Icons.group, color: Colors.black)),
//             Tab(icon: Icon(Icons.create, color: Colors.black)),
//             Tab(icon: Icon(Icons.military_tech, color: Colors.black)),
//             Tab(icon: Icon(Icons.public, color: Colors.black)),
//     ]);
//   }
//
//   Widget getTabBarPages() {
//     return TabBarView(controller: tabController, children: <Widget>[
//           Color(),
//           Famous(),
//           Drawing(),
//           History(),
//           Others(),
//     ]);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           flexibleSpace: SafeArea(
//             child: getTabBar(),
//           ),
//         ),
//         body: getTabBarPages( ));
//   }
// }
//
//
