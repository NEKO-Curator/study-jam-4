import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            height: 224.h,
          ),
          Expanded(child: Text('Шар')),
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
