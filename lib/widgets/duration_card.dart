import 'package:flutter/material.dart';
import 'package:playlist_duration/models/duration.dart';
import 'package:playlist_duration/widgets/average.dart';
import 'package:playlist_duration/widgets/duration_row.dart';

class DurationInfoCard extends StatefulWidget {
  final Durations durations;
  DurationInfoCard({
    Key key,
    @required this.durations,
  }) : super(key: key);

  @override
  _DurationInfoCardState createState() => _DurationInfoCardState();
}

class _DurationInfoCardState extends State<DurationInfoCard> {
  static const values = ['x1.00', 'x1.25', 'x1.50', 'x1.75', 'x2.00'];
  String selectedValue = values[0];
  DurationInfo _duration;

    @override
  void initState() {
    super.initState();
    _duration = widget.durations.x100;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Playlist length at speed: ',
                style: TextStyle(fontSize: 20.0),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      border: Border.all(
                        color: Colors.grey.shade700,
                        style: BorderStyle.solid,
                        width: 0.60,
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: selectedValue,
                      iconSize: 15,
                      elevation: 8,
                      underline: Container(),
                      onChanged: (String newValue) {
                        setState(() {
                          onSpeedChanged(newValue);
                          selectedValue = newValue;
                        });
                      },
                      items:
                          values.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
        DurationRow(
          duration: _duration,
        ),
        const Divider(),
        AverageRow(duration: widget.durations.avg,)
      ],
    );
  }

  onSpeedChanged(String speed) {
    switch (speed) {
      case 'x1.00':
        _duration = widget.durations.x100;
        break;
      case 'x1.25':
        _duration = widget.durations.x125;
        break;
      case 'x1.50':
        _duration = widget.durations.x150;
        break;
      case 'x1.75':
        _duration = widget.durations.x175;
        break;
      case 'x2.00':
        _duration = widget.durations.x200;
        break;
      default:
    }
  }
}