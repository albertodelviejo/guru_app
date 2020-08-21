import 'package:flutter/material.dart';
import 'package:guru_app/User/ui/widgets/welcome_column.dart';
import 'package:guru_app/widgets/gradient_back.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: null),
          WelcomeColumn()

        ],
      ),
    );
  }
}
