// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// TitleWidget: StatelessWidget Class
class TitleWidget extends StatelessWidget {
  // Final & Parameter: Class Properties
  final String title;

  // Constructor
  const TitleWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
