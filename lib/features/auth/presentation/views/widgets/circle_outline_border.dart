import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';

class CircleOutlineBorder extends StatelessWidget {
  const CircleOutlineBorder({super.key, required this._size, required this._borderWidth});

  final double _size;
  final double _borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size,
      width: _size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white10, width: _borderWidth),
      ),
    );
  }
}
