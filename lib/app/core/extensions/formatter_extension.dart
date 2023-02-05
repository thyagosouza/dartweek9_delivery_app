import 'package:intl/intl.dart';
//? SERÁ COLOCADA UMA EXTENSÃO NO double PARA PODER FORMATAR O PREÇO
//* MUDANÇA NECESSÁRIA PARA ACRESCENTAR O TIPO DE MOEDA COM O PACKAGE intl

extension FormatterExtension on double {
  String get currencyPTBR {
    final currencyFormat = NumberFormat.currency(
        locale: 'pt_BR',
        //symbol: 'R\$'
        symbol: r'R$');
    return currencyFormat.format(this);
  }
}
