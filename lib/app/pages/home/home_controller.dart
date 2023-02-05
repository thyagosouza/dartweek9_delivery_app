// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dw9_delivery_app/app/pages/home/home_state.dart';
import 'package:dw9_delivery_app/app/repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;
  HomeController(
    this._productsRepository,
  ) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(
      state.copyWith(status: HomeStateStatus.loading),
    );
    try {
      //await Future.delayed(Duration(seconds: 2));
      final products = await _productsRepository.findAllProducts();
      //throw Exception();

      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e) {
      // print('Erro ao buscar produtos');
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Erro ao buscar produtos'));
    }
  }

  void addOrUpdateBag(OrderProductDto orderProduct) {
    //? ... <- é um destructor, spread operator. Pega todos os itens da lista e retornar sem precisar loop
    //* duplicação da lista para o bloc conseguir ver
    final shoppingBag = [...state.shoppingBag];
    shoppingBag.add(orderProduct);
    emit(state.copyWith(shoppingBag: shoppingBag));
  }
}
