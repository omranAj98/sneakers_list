import 'package:flutter/material.dart';

extension ContextExtensionss on BuildContext {
   TextTheme get customTextTheme => Theme.of(this).textTheme;
}
