import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_practice_magic_ball/presentation/magic_ball/bloc/magic_ball_bloc.dart';

class BallWidget extends StatefulWidget {
  const BallWidget({super.key});

  @override
  State<BallWidget> createState() => _BallWidgetState();
}

class _BallWidgetState extends State<BallWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MagicBallBloc, MagicBallState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/ballDark.png'),
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    context
                        .read<MagicBallBloc>()
                        .add(const MagicBallEvent.getFortuneRequested());
                    print("Image tapped!");
                  },
                  customBorder: const CircleBorder(),
                  child: SizedBox(
                    width: 333.w,
                    height: 333.h,
                  ),
                ),
              ),
            ),
            // Conditionally display the fortune text at the center
            state.maybeWhen(
              success: (fortune) => Container(
                width: 200, // Adjust the size as needed
                height: 200, // Adjust the size as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    fortune,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              orElse: () => Container(), // Display nothing for other states
            ),
          ],
        );
      },
    );
  }
}
