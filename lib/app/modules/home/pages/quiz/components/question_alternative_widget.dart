import 'package:country_quiz/shared/colors.dart';
import 'package:flutter/material.dart';

enum AlternativeState { selected, correct, wrong, unselected }

class QuestionAlternative extends StatelessWidget {
  final String letter;
  final String label;
  final AlternativeState state;
  final Function() onTap;

  const QuestionAlternative({
    Key key,
    @required this.letter,
    @required this.label,
    this.state,
    this.onTap,
  }) : super(key: key);

  TextStyle get style => TextStyle(
        color: state == AlternativeState.unselected
            ? AppColors.purple
            : Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );

  Color getstateColor() {
    switch (state) {
      case AlternativeState.selected:
        return AppColors.orange;
        break;
      case AlternativeState.correct:
        return AppColors.green;
        break;
      case AlternativeState.wrong:
        return AppColors.red;
        break;
      default:
        return null;
    }
  }

  Color getBorderColor() {
    switch (state) {
      case AlternativeState.selected:
        return AppColors.orange;
        break;
      case AlternativeState.correct:
        return AppColors.green;
        break;
      case AlternativeState.wrong:
        return AppColors.red;
        break;
      default:
        return AppColors.purple.withOpacity(0.7);
    }
  }

  bool get hasIcon =>
      state == AlternativeState.correct || state == AlternativeState.wrong;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: getstateColor(),
          border: Border.all(color: getBorderColor(), width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Row(
            children: [
              Text(letter, style: style),
              SizedBox(width: 30),
              Flexible(
                child: Text(label, style: style.copyWith(fontSize: 14)),
              ),
              if (hasIcon) ...[
                Spacer(),
                Icon(
                  state == AlternativeState.correct
                      ? Icons.check_circle_outline
                      : Icons.close,
                  color: Colors.white,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
