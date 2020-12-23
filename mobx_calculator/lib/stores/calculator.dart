import 'package:mobx/mobx.dart';
part 'calculator.g.dart';

// запуск на кодогенерацию:
// flutter pub run build_runner build --delete-conflicting-outputs

// создаем стор
class _CalculatorImpl extends CalculatorStore with _$_CalculatorImpl {}

abstract class CalculatorStore with Store {
  // фактори обеспечивает единственность экземпляра
  factory CalculatorStore.create() => _CalculatorImpl();
  CalculatorStore();

  // начальное значение для числа
  final number = Observable(1);

  // две строки, которые будем собирать
  final stringOne = Observable('');
  final stringTwo = Observable('');

  // результат, который будем показывать
  @computed
  // Можно записать в простой или сложной форме
  //  String get stringRes => stringOne.value + " " + stringTwo.value;
  String get stringRes {
    String res = stringOne.value + stringTwo.value;
    return '${res.toUpperCase()} length: ${res.length}';
  }

  // экшены для изменения переменных
  @action
  void increment(int inc) {
    number.value += inc;
  }

  @action
  void setStringOne(String newString) {
    stringOne.value = newString;
  }

  @action
  void setStringTwo(String newString) {
    stringTwo.value = newString;
  }
}
