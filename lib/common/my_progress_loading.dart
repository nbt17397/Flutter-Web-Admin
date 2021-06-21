import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyProgressLoading {
  static final circleLoading = Platform.isIOS
      ? CupertinoActivityIndicator(
          radius: 20,
          animating: true,
        )
      : CircularProgressIndicator(
          strokeWidth: 3,
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xffFF8330)),
        );
  static LinearProgressIndicator linearLoading = LinearProgressIndicator(
    backgroundColor: Colors.white,
    valueColor: AlwaysStoppedAnimation<Color>(Color(0xffFF8330)),
  );

  static final loading = SpinKitThreeBounce(
    size: 30,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven
              ? Colors.blueAccent
              : Colors.redAccent,
        ),
      );
    },
  );
}
