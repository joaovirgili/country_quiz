import 'package:country_quiz/shared/assets.dart';
import 'package:country_quiz/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizResultWidget extends StatelessWidget {
  final void Function() onTapTryAgain;

  const QuizResultWidget({Key key, this.onTapTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.results,
              height: 113,
              width: 50,
            ),
            const SizedBox(height: 50),
            Text(
              "Results",
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                text: "You got ",
                children: [
                  TextSpan(
                    text: "4",
                    style: TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.w800,
                      fontSize: 38,
                    ),
                  ),
                  TextSpan(text: " correct answers.")
                ],
              ),
            ),
            const SizedBox(height: 50),
            SecondaryButton(
              label: "Try again",
              onTap: onTapTryAgain,
            ),
          ],
        ),
      ),
    );
  }
}

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
