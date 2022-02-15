// https://youtube.googleapis.com/youtube/v3/playlists?part=snippet&fields=items/snippet/title,items/snippet/channelTitle,items/snippet/thumbnails&key=AIzaSyCarVDjOK4KkoCLBjyje5Hkqn2ohVWPMBc&id=PLgutLmyBEXu7yFLVgygzhyYzGzys8wWf6
class Playlist {
	List<Items> items;

	Playlist({this.items});

	Playlist.fromJson(Map<String, dynamic> json) {
		if (json['items'] != null) {
			items = [];
			json['items'].forEach((v) { items.add(Items.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = Map<String, dynamic>();
		if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Items {
	Snippet snippet;

	Items({this.snippet});

	Items.fromJson(Map<String, dynamic> json) {
		snippet = json['snippet'] != null ? Snippet.fromJson(json['snippet']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = Map<String, dynamic>();
		if (this.snippet != null) {
      data['snippet'] = this.snippet.toJson();
    }
		return data;
	}
}

class Snippet {
	String title;
	Thumbnails thumbnails;
	String channelTitle;

	Snippet({this.title, this.thumbnails, this.channelTitle});

	Snippet.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		thumbnails = json['thumbnails'] != null ? Thumbnails.fromJson(json['thumbnails']) : null;
		channelTitle = json['channelTitle'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = Map<String, dynamic>();
		data['title'] = this.title;
		if (this.thumbnails != null) {
      data['thumbnails'] = this.thumbnails.toJson();
    }
		data['channelTitle'] = this.channelTitle;
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