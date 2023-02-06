// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dw9_delivery_app/app/core/extensions/formatter_extension.dart';
import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDto> bag;

  const ShoppingBagWidget({
    super.key,
    required this.bag,
  });

  Future<void> _goOrder(BuildContext context) async {
    //? SHARED PREFERENCES
    final navigator = Navigator.of(context);
    final sp = await SharedPreferences.getInstance();
    if (!sp.containsKey('accessToken')) {
      //? Se não tem o accessToken, enviar para login
      final loginResult = await navigator.pushNamed('/auth/login');
    }
    //? Enviar para o order
  }

  @override
  Widget build(BuildContext context) {
    var totalBag = bag
        .fold<double>(
          0.0,
          (total, element) => total += element.totalPrice,
        )
        .currencyPTBR;

    return Container(
      width: context.sWidth,
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black26,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
            onPressed: () {
              // Navigator.of(context).pushNamed('auth/login');
              _goOrder(context);
            },
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.shopping_cart_outlined)),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Ver Sacola',
                    style:
                        context.textStyle.textExtraBold.copyWith(fontSize: 14),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    totalBag,
                    style:
                        context.textStyle.textExtraBold.copyWith(fontSize: 13),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
