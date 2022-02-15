// https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails&maxResults=50&fields=items/contentDetails/videoId,nextPageToken&key=AIzaSyCarVDjOK4KkoCLBjyje5Hkqn2ohVWPMBc&playlistId=PLQOaTSbfxUtCrKs0nicOg2npJQYSPGO9r

// import 'dart:convert';

// PlaylistItems playlistItemsFromJson(String str) =>
//     PlaylistItems.fromJson(json.decode(str));

// String playlistItemsToJson(PlaylistItems data) => json.encode(data.toJson());

class PlaylistItems {
  String nextPageToken;
  List<Items> items;
  PageInfo pageInfo;

  PlaylistItems({this.nextPageToken, this.items, this.pageInfo});

  PlaylistItems.fromJson(Map<String, dynamic> json) {
    nextPageToken = json['nextPageToken'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(Items.fromJson(v));
      });
    }
    pageInfo =
        json['pageInfo'] != null ? PageInfo.fromJson(json['pageInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nextPageToken'] = this.nextPageToken;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    if (this.pageInfo != null) {
      data['pageInfo'] = this.pageInfo.toJson();
    }
    return data;
  }
}

class Items {
  ContentDetails contentDetails;

  Items({this.contentDetails});

  Items.fromJson(Map<String, dynamic> json) {
    contentDetails = json['contentDetails'] != null
        ? ContentDetails.fromJson(json['contentDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.contentDetails != null) {
      data['contentDetails'] = this.contentDetails.toJson();
    }
    return data;
  }
}

class ContentDetails {
  String videoId;

  ContentDetails({this.videoId});

  ContentDetails.fromJson(Map<String, dynamic> json) {
    videoId = json['videoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['videoId'] = this.videoId;
    return data;
  }
}

class PageInfo {
  int totalResults;
  int resultsPerPage;

  PageInfo({this.totalResults, this.resultsPerPage});

  PageInfo.fromJson(Map<String, dynamic> json) {
    totalResults = json['totalResults'];
    resultsPerPage = json['resultsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['totalResults'] = this.totalResults;
    data['resultsPerPage'] = this.resultsPerPage;
    return data;
  }
}
