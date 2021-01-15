import 'package:country_quiz/shared/assets.dart';
import 'package:country_quiz/shared/colors.dart';
import 'package:country_quiz/shared/components/secondary_button.dart';
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
