import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_quiz/shared/colors.dart';
import 'package:country_quiz/shared/constants.dart';
import 'package:country_quiz/shared/urls.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'custom_button_widget.dart';

class QuestionAlternativeModel extends Equatable {
  final String letter;
  final String label;
  final bool type;

  QuestionAlternativeModel({
    @required this.letter,
    @required this.label,
    this.type,
  });

  @override
  List<Object> get props => [letter];
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key key,
    @required this.alternatives,
    this.countryName,
    this.onTapNext,
    this.countryCode,
    this.onTimeFinished,
  }) : super(key: key);

  final List<Widget> alternatives;
  final Function onTapNext;
  final String countryName;
  final String countryCode;
  final Function onTimeFinished;

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
        padding: const EdgeInsets.fromLTRB(18.0, 0, 18, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 48),
            if (countryCode != null)
              Align(
                alignment: Alignment.centerLeft,
                child: FlagImage(countryCode: countryCode),
              ),
            SizedBox(height: 24),
            QuestionTimerWidget(
              limitTime: AppConstants.quizLimitTime,
              onFinish: onTimeFinished,
            ),
            SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                countryCode == null
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
            CustomButton(onTap: onTapNext),
          ],
        ),
      ),
    );
  }
}

class FlagImage extends StatelessWidget {
  const FlagImage({
    Key key,
    @required this.countryCode,
  }) : super(key: key);

  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: AppUrls.countryFlagImage.replaceAll("{code}", countryCode),
      placeholder: (context, _) => _buildLoading(),
      imageBuilder: (context, provider) => Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image(
            image: provider,
            height: 80,
            fit: BoxFit.fitHeight,
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildLoading() {
    return SizedBox(
      height: 80,
      width: 120,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class QuestionTimerWidget extends StatefulWidget {
  const QuestionTimerWidget({
    Key key,
    this.limitTime = 30,
    this.onFinish,
  }) : super(key: key);

  final int limitTime;
  final Function onFinish;

  @override
  _QuestionTimerWidgetState createState() => _QuestionTimerWidgetState();
}

class _QuestionTimerWidgetState extends State<QuestionTimerWidget> {
  double _currentTime;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = (widget.limitTime * 1000).toDouble();

    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      _currentTime -= 100;
      setState(() {});
      if (_currentTime == 0) {
        timer.cancel();
        if (widget.onFinish != null) {
          widget.onFinish();
        }
      }
    });
  }

  bool get isTimeFinishing => _currentTime / 1000 <= widget.limitTime / 2;
  double get currentTimeToPercent => _currentTime / 1000 / widget.limitTime;

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: LinearProgressIndicator(
              value: currentTimeToPercent,
              minHeight: 50,
              backgroundColor:
                  (isTimeFinishing ? AppColors.red : AppColors.green)
                      .withOpacity(0.35),
              valueColor: AlwaysStoppedAnimation<Color>(
                isTimeFinishing ? AppColors.red : AppColors.green,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(_formatTime(), style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final duration = Duration(milliseconds: _currentTime.toInt());
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
