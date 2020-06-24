import 'package:flutter/material.dart';

class ChangeWidgetsProvider extends ChangeNotifier {
  bool _isPressed;
  ChangeWidgetsProvider(this._isPressed);

  getWidgetState() => _isPressed;
  setWidgetState(bool press) => _isPressed = press;
}
