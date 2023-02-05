import 'package:dw9_delivery_app/app/pages/product_detail/product_detail_controller.dart';
import 'package:dw9_delivery_app/app/pages/product_detail/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailRouter {
  //? CONSTRUTOR PRIVADO
  ProductDetailRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ProductDetailController(),
          )
        ],
        //? BUILDER PERMITER ACRESCENTAR UM METODO
        builder: (context, child) {
          //? recuperar primeiro os argumentos
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return ProductDetailPage(
            product: args['product'],
            order: args['order'],
          );
        },

        //? NÃO PRECISA DO CHILD, AGORA SUBSTITUIDO PELO BUILDER
        // child: const ProductDetailPage(),
      );
}
