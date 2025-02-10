import 'package:flutter/material.dart';
import 'package:guia_de_moteis/core/models/periodo.dart';
import 'package:guia_de_moteis/ui/widgets/custom_typography.dart';
import 'package:guia_de_moteis/utils/extract_percentage_value.dart';
import 'package:guia_de_moteis/utils/format_to_currency.dart';

class RowPrice extends StatelessWidget {
  final Periodo periodo;
  const RowPrice({super.key, required this.periodo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (periodo.desconto != null)
            _buildWithDiscount()
          else
            _buildWithoutDiscount(),
          if (periodo.desconto != null)
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
        ],
      ),
    );
  }

  Widget _buildWithoutDiscount() {
    return Row(
      children: [
        Container(
          width: 1,
          height: 50,
          color: Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTypography(
              text: periodo.tempoFormatado.toString(),
              color: Colors.grey,
              variant: TypographyVariant.h2,
            ),
            CustomTypography(
              text: formatCurrency(periodo.valor),
              color: Colors.grey,
              variant: TypographyVariant.h2,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWithDiscount() {
    final discount =
        extractPercentage(periodo.valor, periodo.desconto!.desconto)
            .toStringAsPrecision(2);
    return Row(
      children: [
        Container(
          width: 1,
          height: 50,
          color: Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                _buildPriceText(
                  value: periodo.tempoFormatado.toString(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: CustomTypography(
                    text: "${discount.toString()}% off",
                    color: Colors.green,
                    variant: TypographyVariant.h4,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                _buildPriceTextLineThrough(periodo.valor),
                const SizedBox(
                  width: 10,
                ),
                _buildPriceText(
                  value: formatCurrency(periodo.valorTotal),
                  color: Colors.black,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceTextLineThrough(double value) {
    return CustomTypography(
      text: formatCurrency(value),
      color: Colors.grey,
      variant: TypographyVariant.h2,
      decoration: TextDecoration.lineThrough,
    );
  }

  Widget _buildPriceText({required String value, Color? color}) {
    return CustomTypography(
      text: value,
      color: color ?? Colors.grey,
      variant: TypographyVariant.h2,
    );
  }
}
