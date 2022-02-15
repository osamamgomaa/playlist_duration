import 'package:playlist_duration/models/playlist_items.dart';
import 'package:playlist_duration/models/video.dart';
import 'package:playlist_duration/models/video_list.dart';
import 'package:playlist_duration/utils/duration.dart';
import 'package:playlist_duration/utils/services.dart';
import 'package:playlist_duration/models/duration.dart';

class DurationCalculator {
  PlaylistItems _playlistsItems = PlaylistItems();
  VideosList _videosList = VideosList();
  List<Video> _videos = [];
  List<Duration> _durations = [];
  String _nextPageToken = '';
  int count = 0;
  DateTime dateAfter =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  _loadPlaylistItems(String playlistId) async {
    PlaylistItems tempPlaylistItems = await Services.getPlaylistItems(
      playListId: playlistId,
      pageToken: _nextPageToken,
    );
    _nextPageToken = tempPlaylistItems.nextPageToken;
    _playlistsItems = tempPlaylistItems;

    List<String> videoIds = [];
    for (int i = 0; i < _playlistsItems.items.length; i++) {
      videoIds.add(_playlistsItems.items[i].contentDetails.videoId);
    }
    count += videoIds.length;
    await _loadVideosList(videoIds.join(','));
  }

  _loadVideosList(String ids) async {
    VideosList tempVideoList = await Services.getVideosList(ids: ids);
    _videosList = tempVideoList;
    await _addDurations();
  }

  _addDurations() async {
    for (int i = 0; i < _videosList.items.length; i++) {
      Duration _duration =
          await toDuration(_videosList.items[i].contentDetails.duration);
      _durations.add(_duration);
      dateAfter = dateAfter.add(_duration);
    }
  }

  List<Video> getDurations() {
    for (int i = 0; i < _durations.length; i++) {
      _videos.add(Video(videoIndex: i, duration: _durations[i].inMinutes));
    }
    return _videos;
  }

  Future<Durations> getData(String playlistId) async {
    do {
      await _loadPlaylistItems(playlistId);
    } while (count < _playlistsItems.pageInfo.totalResults);
    return calcDuration(dateAfter, _playlistsItems.pageInfo.totalResults);
  }
}
