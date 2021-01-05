import 'package:flutter/material.dart';

import 'custom_button_widget.dart';
import 'question_alternative_widget.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 48, 18, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Kuala Lumpur is the capital of",
                style: TextStyle(
                  color: Color(0xff2F527B),
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 24),
            QuestionAlternative(
              letter: "A",
              label: "Vietnam",
              type: false,
            ),
            SizedBox(height: 18),
            QuestionAlternative(
              letter: "B",
              label: "Malaysia",
              type: true,
            ),
            SizedBox(height: 18),
            QuestionAlternative(letter: "C", label: "Sweden"),
            SizedBox(height: 18),
            QuestionAlternative(letter: "D", label: "Austria"),
            SizedBox(height: 18),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
