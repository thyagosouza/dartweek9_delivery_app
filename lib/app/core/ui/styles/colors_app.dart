import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFF007D21);
  Color get secondary => const Color(0xFFF88B0C);
}

//? TER ACESSO DAS CORES ATRAVÉS DO BUILDCONTEXT
extension ColorsAppExcetions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
