import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

  static const _paddingHorizontal = 20.0;
  static const _paddingVertical = 12.0;
  static const _iconPadding = 6.0;
  static const _iconSize = 24.0;

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
    final progressWidth = (0.3 * progressBarWidth);
    final restProgress = (progressBarSize?.width ?? double.infinity) -
        progressWidth -
        _iconSize -
        _iconPadding * 2;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: _paddingHorizontal,
        vertical: _paddingVertical,
      ),
      decoration: BoxDecorationConstants.roundedDecoration(),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          SizedBox(
            key: key,
            width: double.infinity,
          ),
          AnimatedSize(
            duration: const Duration(
              seconds: 1,
            ),
            curve: Curves.easeIn,
            child: Container(
              width: progressWidth,
              height: 2.0,
              decoration: BoxDecorationConstants.roundedDecoration(
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: _iconPadding,
            ),
            child: const Icon(
              Icons.sunny,
              size: _iconSize,
            )
                .animate(
                  target: progressWidth > 0.0 ? 1 : 0,
                )
                .moveX(
                  begin: 0,
                  end: progressWidth,
                  duration: const Duration(
                    seconds: 1,
                  ),
                  curve: Curves.easeIn,
                ),
          ),
          AnimatedSize(
            duration: const Duration(
              seconds: 1,
            ),
            curve: Curves.easeIn,
            child: Container(
              margin: EdgeInsets.only(
                left: progressWidth + _iconPadding * 2 + _iconSize,
              ),
              width: restProgress,
              height: 2.0,
              decoration: BoxDecorationConstants.roundedDecoration(
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
