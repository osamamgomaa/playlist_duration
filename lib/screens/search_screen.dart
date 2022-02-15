import 'package:flutter/material.dart';
import 'package:playlist_duration/screens/search_results_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            onEditingComplete: () {
              getResults(context);
            },
            controller: _controller,
            decoration: InputDecoration(
                hintText: "Search",
                labelText: "Search",
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
              child: Text('Search'),
              onPressed: () {
                getResults(context);
              })
        ],
      ),
    );
  }

  void getResults(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SearchResultsScreen(q: _controller.text);
        },
      ),
    );
  }
}
