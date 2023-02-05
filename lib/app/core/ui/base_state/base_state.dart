//? CONTÉM METODOS IMPLEMENTADOS PARA SEREM EXTENDIDOS EM ALGUM LUGAR
//* <T> = COMUM GENÉRICO .. recebe segundo parâmetro C = controller
import 'package:dw9_delivery_app/app/core/ui/helpers/loader.dart';
import 'package:dw9_delivery_app/app/core/ui/helpers/messages.dart';
import 'package:dw9_delivery_app/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseState<T extends StatefulWidget, C extends BlocBase>
    extends State<T> with Loader, Messages {
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();

    //? Executa depois que a tela for construida
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //? DENTRO DO HOMECONTROLLER, BUSCA OS PRODUTOS
      context.read<HomeController>().loadProducts();
      //     context.read<HomeController>().loadProducts();
      onReady();
    });
  }

  void onReady() {}
}
