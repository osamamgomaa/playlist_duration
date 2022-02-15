import 'package:flutter/material.dart';
import 'package:playlist_duration/models/duration.dart';
import 'package:playlist_duration/models/video.dart';
import 'package:playlist_duration/utils/duration_calculator.dart';
import 'package:playlist_duration/widgets/widgets.dart';

class PlaylistInfoScreen extends StatefulWidget {
  PlaylistInfoScreen({
    @required this.playlistId,
    @required this.thumbnailUrl,
    @required this.title,
    @required this.channelName,
  });
  final String playlistId;
  final String thumbnailUrl;
  final String title;
  final String channelName;

  @override
  _PlaylistInfoScreenState createState() => _PlaylistInfoScreenState();
}

class _PlaylistInfoScreenState extends State<PlaylistInfoScreen> {
  DurationCalculator _calculator = DurationCalculator();
  Durations _durations;
  List<Video> _listVidoes = [];
  bool _loading = true;

  _loadData() async {
    setState(() {
      _loading = true;
    });
    _durations = await _calculator.getData(widget.playlistId);
    _listVidoes = _calculator.getDurations();
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                PlaylistCard(
                  thumbnailUrl: widget.thumbnailUrl,
                  title: widget.title,
                  channelName: widget.channelName,
                  hasPadding: true,
                ),
                const Divider(),
                DurationInfoCard(
                  durations: _durations,
                ),
                PointsLineChart(
                  listVidoes: _listVidoes,
                ),
              ],
            ),
    );
  }
}
