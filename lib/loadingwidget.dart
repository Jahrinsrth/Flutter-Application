import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OnLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Center(
        child:SpinKitThreeBounce(
          color: Colors.red[600],
          size:50.0,
        )
      )
    );
  }
}
