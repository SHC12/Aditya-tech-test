import 'package:aditya_movie/infrastructure/theme/colors.dart';
import 'package:aditya_movie/presentation/movie/movie_search.screen.dart';
import 'package:aditya_movie/presentation/screens.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List<Widget> screen = [
    HomeScreen(),
    MovieSearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(Remix.home_2_line, color: secondaryColor),
            Icon(Remix.search_2_line, color: secondaryColor),
            Icon(Remix.user_line, color: secondaryColor),
          ],
          color: whiteColor,
          buttonBackgroundColor: whiteColor,
          backgroundColor: bgColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: screen.elementAt(_page));
  }
}
