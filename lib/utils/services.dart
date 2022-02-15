import 'dart:io';

import 'package:playlist_duration/models/playlist_info.dart';
import 'package:playlist_duration/models/result_playlists.dart';
import 'package:playlist_duration/models/playlist_items.dart';

import 'package:playlist_duration/constants.dart';
import 'package:playlist_duration/models/video_list.dart';
import 'package:playlist_duration/utils/api_helper.dart';

class Services {
  static Future<PlaylistItems> getPlaylistItems(
      {String playListId, String pageToken}) async {
    Map<String, String> parameters = {
      'part': 'contentDetails',
      'playlistId': playListId,
      'fields': 'items/contentDetails/videoId,nextPageToken,pageInfo',
      'maxResults': '50',
      'pageToken': pageToken,
      'key': Constants.API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      Constants.BASE_URL,
      '/youtube/v3/playlistItems',
      parameters,
    );
    var responseJson = await ApiBaseHelper.get(uri, headers: headers);
    PlaylistItems resultsList = PlaylistItems.fromJson(responseJson);
    return resultsList;
  }

  static Future<Playlist> getPlaylistInfo({String id}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'fields':
          'items/snippet/title,items/snippet/channelTitle,items/snippet/thumbnails',
      'id': id,
      'key': Constants.API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      Constants.BASE_URL,
      '/youtube/v3/playlists',
      parameters,
    );
    var responseJson = await ApiBaseHelper.get(uri, headers: headers);
    Playlist playlist = Playlist.fromJson(responseJson);
    return playlist;
  }

  static Future<VideosList> getVideosList({String ids}) async {
    Map<String, String> parameters = {
      'part': 'contentDetails',
      'id': ids,
      'fields': 'items/contentDetails/duration',
      'key': Constants.API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      Constants.BASE_URL,
      '/youtube/v3/videos',
      parameters,
    );
    var responseJson = await ApiBaseHelper.get(uri, headers: headers);
    VideosList videosList = VideosList.fromJson(responseJson);
    return videosList;
  }

  static Future<ResultPlaylists> searchPlaylists(
      {String q, String pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'maxResults': '50',
      'order': 'relevance',
      'type': 'playlist',
      'pageToken': pageToken,
      'q': q,
      'key': Constants.API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      Constants.BASE_URL,
      '/youtube/v3/search',
      parameters,
    );
    var responseJson = await ApiBaseHelper.get(uri, headers: headers);
    ResultPlaylists resultsList = ResultPlaylists.fromJson(responseJson);
    return resultsList;
  }
}
