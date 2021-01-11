import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_button_widget.dart';
import 'question_alternative_widget.dart';

class QuestionAlternativeModel {
  final String letter;
  final String label;
  final bool type;

  QuestionAlternativeModel({
    @required this.letter,
    @required this.label,
    this.type,
  });
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key key,
    @required this.alternatives,
    this.countryName,
    this.onTapNext,
    this.flagUrl,
  }) : super(key: key);

  final List<Widget> alternatives;
  final Function onTapNext;
  final String countryName;
  final String flagUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 0, 18, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 48),
            if (flagUrl != null)
              Align(
                alignment: Alignment.topLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SvgPicture.network(
                    flagUrl,
                    height: 55,
                    width: 85,
                  ),
                ),
              ),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                flagUrl == null
                    ? "$countryName is the capital of"
                    : "Which country does this flag belong to?",
                style: TextStyle(
                  color: Color(0xff2F527B),
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 24),
            ...alternatives,
            // ...alternatives
            //     .map((e) => Column(
            //           children: [
            //             QuestionAlternative(
            //               letter: e.letter,
            //               label: e.label,
            //               type: e.type,
            //               onTap: () => onTapAlternative(e),
            //             ),
            //             SizedBox(height: 18),
            //           ],
            //         ))
            //     .toList(),
            CustomButton(onTap: onTapNext),
          ],
        ),
      ),
    );
  }
}
