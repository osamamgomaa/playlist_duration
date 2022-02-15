// https://youtube.googleapis.com/youtube/v3/search?maxResults=50&part=snippet&order=relevance&type=playlist&key=AIzaSyCarVDjOK4KkoCLBjyje5Hkqn2ohVWPMBc&q=python
import 'dart:convert';

ResultPlaylists resultPlaylistsFromJson(String str) =>
    ResultPlaylists.fromJson(json.decode(str));

String resultPlaylistsToJson(ResultPlaylists data) => json.encode(data.toJson());

class ResultPlaylists {
	String kind;
	String etag;
	String nextPageToken;
	String regionCode;
	PageInfo pageInfo;
	List<Item> items;

	ResultPlaylists({this.kind, this.etag, this.nextPageToken, this.regionCode, this.pageInfo, this.items});

	ResultPlaylists.fromJson(Map<String, dynamic> json) {
		kind = json['kind'];
		etag = json['etag'];
		nextPageToken = json['nextPageToken'];
		regionCode = json['regionCode'];
		pageInfo = json['pageInfo'] != null ? PageInfo.fromJson(json['pageInfo']) : null;
		if (json['items'] != null) {
			items = [];
			json['items'].forEach((v) { items.add(Item.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = Map<String, dynamic>();
		data['kind'] = this.kind;
		data['etag'] = this.etag;
		data['nextPageToken'] = this.nextPageToken;
		data['regionCode'] = this.regionCode;
		if (this.pageInfo != null) {
      data['pageInfo'] = this.pageInfo.toJson();
    }
		if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
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

class Item {
	String kind;
	String etag;
	Id id;
	Snippet snippet;

	Item({this.kind, this.etag, this.id, this.snippet});

	Item.fromJson(Map<String, dynamic> json) {
		kind = json['kind'];
		etag = json['etag'];
		id = json['id'] != null ? Id.fromJson(json['id']) : null;
		snippet = json['snippet'] != null ? Snippet.fromJson(json['snippet']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = Map<String, dynamic>();
		data['kind'] = this.kind;
		data['etag'] = this.etag;
		if (this.id != null) {
      data['id'] = this.id.toJson();
    }
		if (this.snippet != null) {
      data['snippet'] = this.snippet.toJson();
    }
		return data;
	}
}

class Id {
	String kind;
	String playlistId;

	Id({this.kind, this.playlistId});

	Id.fromJson(Map<String, dynamic> json) {
		kind = json['kind'];
		playlistId = json['playlistId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = Map<String, dynamic>();
		data['kind'] = this.kind;
		data['playlistId'] = this.playlistId;
		return data;
	}
}

class Snippet {
	String publishedAt;
	String channelId;
	String title;
	String description;
	Thumbnails thumbnails;
	String channelTitle;
	String liveBroadcastContent;
	String publishTime;

	Snippet({this.publishedAt, this.channelId, this.title, this.description, this.thumbnails, this.channelTitle, this.liveBroadcastContent, this.publishTime});

	Snippet.fromJson(Map<String, dynamic> json) {
		publishedAt = json['publishedAt'];
		channelId = json['channelId'];
		title = json['title'];
		description = json['description'];
		thumbnails = json['thumbnails'] != null ? Thumbnails.fromJson(json['thumbnails']) : null;
		channelTitle = json['channelTitle'];
		liveBroadcastContent = json['liveBroadcastContent'];
		publishTime = json['publishTime'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = Map<String, dynamic>();
		data['publishedAt'] = this.publishedAt;
		data['channelId'] = this.channelId;
		data['title'] = this.title;
		data['description'] = this.description;
		if (this.thumbnails != null) {
      data['thumbnails'] = this.thumbnails.toJson();
    }
		data['channelTitle'] = this.channelTitle;
		data['liveBroadcastContent'] = this.liveBroadcastContent;
		data['publishTime'] = this.publishTime;
		return data;
	}
}

class Thumbnails {
	Default defaultThumbnail;
	Default medium;
	Default high;

	Thumbnails({this.defaultThumbnail, this.medium, this.high});

	Thumbnails.fromJson(Map<String, dynamic> json) {
		defaultThumbnail = json['default'] != null ? Default.fromJson(json['default']) : null;
		medium = json['medium'] != null ? Default.fromJson(json['medium']) : null;
		high = json['high'] != null ? Default.fromJson(json['high']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = Map<String, dynamic>();
		if (this.defaultThumbnail != null) {
      data['default'] = this.defaultThumbnail.toJson();
    }
		if (this.medium != null) {
      data['medium'] = this.medium.toJson();
    }
		if (this.high != null) {
      data['high'] = this.high.toJson();
    }
		return data;
	}
}

class Default {
	String url;
	int width;
	int height;

	Default({this.url, this.width, this.height});

	Default.fromJson(Map<String, dynamic> json) {
		url = json['url'];
		width = json['width'];
		height = json['height'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = Map<String, dynamic>();
		data['url'] = this.url;
		data['width'] = this.width;
		data['height'] = this.height;
		return data;
	}
}