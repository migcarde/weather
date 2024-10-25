import 'package:flutter/material.dart';
import 'package:weather/core/constants/box_decoration_constants.dart';

class SunsetIndicator extends StatefulWidget {
  const SunsetIndicator({
    super.key,
    required this.sunrise,
    required this.sunset,
  });

  final DateTime sunrise;
  final DateTime sunset;

  @override
  State<SunsetIndicator> createState() => _SunsetIndicatorState();
}

class _SunsetIndicatorState extends State<SunsetIndicator> {
  final key = GlobalKey();
  Size? progressBarSize;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(
        () {
          final progressBar =
              key.currentContext?.findRenderObject() as RenderBox;

          progressBarSize = progressBar.size;
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final progress = today.hour / (widget.sunset.hour - widget.sunrise.hour);
    final progressBarWidth = progressBarSize?.width ?? 0.0;
    final progressWidth = (progress * progressBarWidth);

    return Container(
      decoration: BoxDecorationConstants.roundedDecoration(),
      child: Stack(
        children: [
          Container(
            key: key,
            width: double.infinity,
            height: 2.0,
            color: Colors.black,
          ),
          Container(
            width: progressWidth,
            height: 2.0,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
