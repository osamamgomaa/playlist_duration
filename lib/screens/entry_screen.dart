import 'package:flutter/material.dart';
import 'package:playlist_duration/models/playlist_info.dart';
import 'package:playlist_duration/screens/playlist_info_screen.dart';
import 'package:playlist_duration/utils/services.dart';
import 'package:clipboard/clipboard.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key key}) : super(key: key);

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  Playlist _playlist = Playlist();
  TextEditingController _controller;

  _loadPlaylistInfo(String id) async {
    Playlist tempPlaylist = await Services.getPlaylistInfo(id: id);
    _playlist = tempPlaylist;
  }

  String _extract(String link) {
    if (!RegExp(r"^([\S]+list=)?([\w_-]+)[\S]*$").hasMatch(link)) {
      throw ArgumentError("String does not follow correct format");
    }
    final idMatch = RegExp(r"^([\S]+list=)?([\w_-]+)[\S]*$").firstMatch(link);
    return idMatch.group(2);
  }

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
            onEditingComplete: () async {
              await getInfo(context);
            },
            controller: _controller,
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  child: Icon(Icons.paste_rounded),
                  onTap: () {
                    FlutterClipboard.paste().then((value) {
                      setState(() {
                        FocusScope.of(context).unfocus();
                        _controller.text = value;
                      });
                    });
                  },
                ),
                hintText: "youtube.com/playlist?list=ID",
                labelText: "Playlist link",
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
            child: Text('Calculate'),
            onPressed: () async {
              await getInfo(context);
            },
          ),
        ],
      ),
    );
  }

  Future<Widget> getInfo(BuildContext context) async {
    await _loadPlaylistInfo(_extract(_controller.text));
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PlaylistInfoScreen(
            thumbnailUrl: _playlist.items[0].snippet.thumbnails.high.url,
            title: _playlist.items[0].snippet.title,
            channelName: _playlist.items[0].snippet.channelTitle,
            playlistId: _extract(_controller.text),
          );
        },
      ),
    );
  }
}
