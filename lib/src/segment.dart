import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_circular_chart_two/src/tween.dart';

class CircularChartSegment extends MergeTweenable<CircularChartSegment> {
  CircularChartSegment(this.rank, this.sweepAngle, this.color, {this.id});

  final int rank;
  final double sweepAngle;
  final Color color;
  final String id;

  @override
  CircularChartSegment get empty => CircularChartSegment(rank, 0.0, color);

  @override
  bool operator <(CircularChartSegment other) => rank < other.rank;

  @override
  Tween<CircularChartSegment> tweenTo(CircularChartSegment other) => CircularChartSegmentTween(this, other);

  static CircularChartSegment lerp(CircularChartSegment begin, CircularChartSegment end, double t, {String id}) {
    assert(begin.rank == end.rank);

    return CircularChartSegment(
      begin.rank,
      lerpDouble(begin.sweepAngle, end.sweepAngle, t),
      Color.lerp(begin.color, end.color, t),
      id: id,
    );
  }
}

class CircularChartSegmentTween extends Tween<CircularChartSegment> {
  CircularChartSegmentTween(CircularChartSegment begin, CircularChartSegment end) : super(begin: begin, end: end) {
    assert(begin.rank == end.rank);
  }

  @override
  CircularChartSegment lerp(double t) => CircularChartSegment.lerp(begin, end, t);
}
