import 'package:dw9_delivery_app/app/core/rest_client/custom_dio.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:dw9_delivery_app/app/pages/home/home_controller.dart';
import 'package:dw9_delivery_app/app/pages/home/home_page.dart';
import 'package:dw9_delivery_app/app/pages/product_detail/product_detail_controller.dart';
import 'package:dw9_delivery_app/app/repositories/products/products_repository.dart';
import 'package:dw9_delivery_app/app/repositories/products/products_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//? DEIXA REPOSITORIO DISPONIVEL PARA SER UTILIZADO NA HOME PAGE DO JEITO QUE PRECISAR

class HomeRouter {
  //? CONSTRUTOR PRIVADO
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: ((context) => ProductsRepositoryImpl(
                  //? CONTEXT DA PROPRIA CLASSE CUSTOM DIO - PEGANDO DO APPLICATION BINDING E INJETANDO AQUI
                  dio: context.read(),
                )),
          ),
          Provider(create: (context) => HomeController(context.read())),
        ],
        child: const HomePage(),
      );
}
