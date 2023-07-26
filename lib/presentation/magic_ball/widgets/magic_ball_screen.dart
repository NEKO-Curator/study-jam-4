import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_practice_magic_ball/presentation/magic_ball/widgets/ball_widget.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(bottom: 56.h, left: 28.w, right: 28.w),
      child: Column(
        children: [
          SizedBox(
            height: 112.h,
          ),
          BallWidget(),
          SizedBox(
            height: 64.h,
          ),
          Expanded(
            child: Text('текст под шаром'),
          ),
          SizedBox(
            height: 56.h,
          ),
        ],
      ),
    ));
  }
}
