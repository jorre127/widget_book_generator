// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetBookWidgetGenerator
// **************************************************************************

import 'package:example/widget/button.dart';
import 'package:example/widget/test.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class UseCases {
  @UseCase(
    name: 'Button',
    type: Button,
  )
  Center buttonUseCase() => const Center(child: SizedBox.shrink());

  @UseCase(
    name: 'Test',
    type: Test,
  )
  Center testUseCase() => const Center(child: SizedBox.shrink());
}
