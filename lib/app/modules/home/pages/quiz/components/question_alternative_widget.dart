import 'package:country_quiz/shared/colors.dart';
import 'package:flutter/material.dart';

class QuestionAlternative extends StatelessWidget {
  final String letter;
  final String label;
  final bool type;

  const QuestionAlternative({
    Key key,
    @required this.letter,
    @required this.label,
    this.type,
  }) : super(key: key);

  TextStyle get style => TextStyle(
        color: type == null ? AppColors.purple : Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type == null
            ? Colors.white
            : type
                ? AppColors.green
                : AppColors.red,
        border: type == null
            ? Border.all(color: AppColors.purple.withOpacity(0.7), width: 2)
            : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: Row(
          children: [
            Text(letter, style: style),
            SizedBox(width: 30),
            Text(label, style: style.copyWith(fontSize: 14)),
            Spacer(),
            if (type != null)
              Icon(
                type ? Icons.check_circle_outline : Icons.close,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
