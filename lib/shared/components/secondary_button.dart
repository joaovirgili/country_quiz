import 'package:flutter/material.dart';

import '../colors.dart';

class SecondaryButton extends StatelessWidget {
  final void Function() onTap;
  final String label;

  const SecondaryButton({
    @required this.label,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.blue, width: 1),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 10,
            color: AppColors.blue.withOpacity(0.5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: AppColors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          highlightColor: AppColors.blue.withOpacity(0.1),
          splashColor: AppColors.blue.withOpacity(0.3),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 48),
            child: Text(
              label,
              style: TextStyle(
                color: AppColors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
