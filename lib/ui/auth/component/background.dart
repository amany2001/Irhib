import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Image.asset(
        "${Const.images}login.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
