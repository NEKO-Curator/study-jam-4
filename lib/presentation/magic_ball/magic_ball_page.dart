import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/presentation/magic_ball/bloc/magic_ball_bloc.dart';
import 'package:surf_practice_magic_ball/presentation/magic_ball/widgets/magic_ball_screen.dart';

class MagicBallPage extends StatelessWidget {
  const MagicBallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MagicBallBloc(),
      child: const MagicBallScreen(),
    );
  }
}
