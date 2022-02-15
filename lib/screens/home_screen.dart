import 'package:flutter/material.dart';
import 'package:playlist_duration/screens/entry_screen.dart';
import 'package:playlist_duration/screens/search_screen.dart';
import 'package:playlist_duration/widgets/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  static const List<Widget> _pages = <Widget>[
    EntryScreen(),
    SearchScreen(),
    Center(
      child: Icon(
        Icons.code_off_rounded,
        size: 150,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Playlist Duration Calculator')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
        selectedItemColor: Colors.white,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.link_rounded),
            activeIcon: Icon(Icons.link_rounded),
            label: 'From link',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            activeIcon: Icon(Icons.search_rounded),
            label: 'From search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_rounded),
            activeIcon: Icon(Icons.playlist_add_rounded),
            label: 'Create',
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}

// Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               _build(context, 'Playlist link', EntryScreen()),
//               SizedBox(
//                 height: 50.0,
//               ),
//               _build(context, 'Search playlists', SearchScreen()),
//             ],
//           ),
//         ),
//       ),

Widget _build(BuildContext context, String title, Widget widget) {
  return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return widget;
            },
          ),
        );
      },
      child: Text(title));
}
