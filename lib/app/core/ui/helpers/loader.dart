import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

//? mixin será adicionado dentro de um State, porque o State tem disponivel o load

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
          context: context,
          builder: (context) {
            return LoadingAnimationWidget.threeArchedCircle(
                color: Colors.white, size: 60);
          });
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }
}
