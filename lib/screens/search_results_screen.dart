import 'package:flutter/material.dart';
import 'package:playlist_duration/models/result_playlists.dart';
import 'package:playlist_duration/screens/playlist_info_screen.dart';
import 'package:playlist_duration/utils/services.dart';
import 'package:playlist_duration/widgets/widgets.dart';

class SearchResultsScreen extends StatefulWidget {
  final String q;
  const SearchResultsScreen({Key key, @required this.q}) : super(key: key);

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  ResultPlaylists _resultPlaylists = ResultPlaylists();
  bool _loading = true;
  // String _q;
  String _nextPageToken = '';
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadPlaylists();
  }

  @override
  void dispose() {
    _loading = false;
    super.dispose();
  }

  _loadPlaylists() async {
    ResultPlaylists tempResultsList = await Services.searchPlaylists(
      q: widget.q,
      pageToken: _nextPageToken,
    );
    _nextPageToken = tempResultsList.nextPageToken;
    _resultPlaylists = tempResultsList;
    setState(
      () {
        _loading = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Search results for ${widget.q}'),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Column(
                children: [
                  Expanded(
                    child: NotificationListener<ScrollEndNotification>(
                      onNotification: (ScrollNotification notification) {
                        if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent) {
                          _loadPlaylists();
                        }
                        return true;
                      },
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: _resultPlaylists.items.length,
                        itemBuilder: (context, index) {
                          Item playlist = _resultPlaylists.items[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PlaylistInfoScreen(
                                      thumbnailUrl:
                                          playlist.snippet.thumbnails.high.url,
                                      title: playlist.snippet.title,
                                      channelName:
                                          playlist.snippet.channelTitle,
                                      playlistId: playlist.id.playlistId,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                                child: PlaylistCard(
                                    thumbnailUrl:
                                        playlist.snippet.thumbnails.high.url,
                                    title: playlist.snippet.title,
                                    channelName:
                                        playlist.snippet.channelTitle)),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
