// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$_CalculatorImpl on CalculatorStore, Store {
  Computed<String> _$stringResComputed;

  @override
  String get stringRes =>
      (_$stringResComputed ??= Computed<String>(() => super.stringRes,
              name: 'CalculatorStore.stringRes'))
          .value;

  final _$CalculatorStoreActionController =
      ActionController(name: 'CalculatorStore');

  @override
  void increment(int inc) {
    final _$actionInfo = _$CalculatorStoreActionController.startAction(
        name: 'CalculatorStore.increment');
    try {
      return super.increment(inc);
    } finally {
      _$CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStringOne(String newString) {
    final _$actionInfo = _$CalculatorStoreActionController.startAction(
        name: 'CalculatorStore.setStringOne');
    try {
      return super.setStringOne(newString);
    } finally {
      _$CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStringTwo(String newString) {
    final _$actionInfo = _$CalculatorStoreActionController.startAction(
        name: 'CalculatorStore.setStringTwo');
    try {
      return super.setStringTwo(newString);
    } finally {
      _$CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stringRes: ${stringRes}
    ''';
  }
}
