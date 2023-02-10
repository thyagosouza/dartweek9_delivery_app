import 'package:dw9_delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  final bool _compact;
  final VoidCallback incrementOnTap;
  final VoidCallback decrementOnTap;
  final int amout;

  const DeliveryIncrementDecrementButton({
    super.key,
    required this.incrementOnTap,
    required this.decrementOnTap,
    required this.amout,
  }) : _compact = false;
  const DeliveryIncrementDecrementButton.compact({
    super.key,
    required this.incrementOnTap,
    required this.decrementOnTap,
    required this.amout,
  }) : _compact = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        //! CHILD DE ONDE VAI SER APLICADO VAI DEFINIR ALTURA(height)
        //! NESSE CASO PAGINA DE DETALHES
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: decrementOnTap,
              child: Text(
                '   -   ',
                style: context.textStyles.textMedium.copyWith(
                  fontSize: _compact ? 16 : 22,
                  color: Colors.grey,
                ),
              ),
            ),
            Text(
              amout.toString(),
              style: context.textStyles.textRegular.copyWith(
                  fontSize: _compact ? 13 : 17,
                  color: context.colors.secondary),
            ),
            InkWell(
              onTap: incrementOnTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  ' + ',
                  style: context.textStyles.textMedium.copyWith(
                    fontSize: _compact ? 16 : 22,
                    color: context.colors.secondary,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
