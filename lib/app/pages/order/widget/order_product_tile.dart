// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:flutter/material.dart';

class OrderProductTile extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;

  const OrderProductTile({
    super.key,
    required this.index,
    required this.orderProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'https://www.anamariabrogui.com.br/assets/uploads/receitas/fotos/usuario-1682-52acab79d88efd805e6a341697e6aecb.jpg',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        const Text('index'),
      ],
    );
  }
}
