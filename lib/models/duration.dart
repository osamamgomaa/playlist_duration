class Durations {
  DurationInfo x100;
  DurationInfo x125;
  DurationInfo x150;
  DurationInfo x175;
  DurationInfo x200;
  DurationInfo avg;


  Durations({this.x100, this.x125, this.x150, this.x175, this.x200, this.avg});
}

class DurationInfo {
  int days;
  int hours;
  int minutes;
  int seconds;

  DurationInfo({this.days, this.hours, this.minutes, this.seconds});
}
