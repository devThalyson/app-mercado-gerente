import 'package:money2/money2.dart';

class ConvertMoney {
  String convertReal(double value) {
    Currency realCurrency = Currency.create('BRL', 2);

    Money finalValue = Money.from(value, realCurrency);

    return "R${finalValue.toString()}";
  }
}
