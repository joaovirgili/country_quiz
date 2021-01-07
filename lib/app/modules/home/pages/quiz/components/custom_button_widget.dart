import 'package:country_quiz/shared/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.onTap,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          highlightColor: Colors.white.withOpacity(0.1),
          splashColor: Colors.white.withOpacity(0.3),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
            child: Text(
              "Next",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
