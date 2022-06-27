import 'package:aditya_movie/presentation/shared/custom_dlalog.widget.dart';
import 'package:flutter/material.dart';

class ExceptionsHelper {
  popUpMessage(var message, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialogWidget(
              message: message,
            ));
  }
}
