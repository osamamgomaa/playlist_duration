import 'package:flutter/material.dart';

class PlaylistCard extends StatelessWidget {
  PlaylistCard(
      {@required this.thumbnailUrl,
      @required this.title,
      @required this.channelName, this.hasPadding = false});
        final bool hasPadding;

  final String thumbnailUrl;
  final String title;
  final String channelName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          thumbnailUrl,
          height: 220.0,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: hasPadding ? EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0) : EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        title == null ? '' : title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 15.0),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        channelName == null ? '' : channelName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, size: 20.0),
            ],
          ),
        )
      ],
    );
  }
}
