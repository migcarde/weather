import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.location,
  });

  final String location;

  static const _textPaddingLeft = 10.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_pin,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: _textPaddingLeft,
          ),
          child: Text(
            location,
          ),
        ),
      ],
    );
  }
}
