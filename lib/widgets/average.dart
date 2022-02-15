import 'package:flutter/material.dart';
import 'package:playlist_duration/models/duration.dart';

class AverageRow extends StatelessWidget {
  final DurationInfo duration;
  const AverageRow({
    Key key,
    @required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Average: ',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w800),),
        if (duration.days != 0)
          _buildAction(context, duration.days.toString(), "Days"),
        if (duration.hours != 0)
          _buildAction(context, duration.hours.toString(), "Hours"),
        _buildAction(context, duration.minutes.toString(), 'Minutes'),
        _buildAction(context, duration.seconds.toString(), 'Seconds'),
      ],
    );
  }

  Widget _buildAction(BuildContext context, String count, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count,
          style: Theme.of(context).textTheme.caption.copyWith(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 6.0),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: Colors.white, fontSize: 15.0),
        ),
      ],
    );
  }
}
