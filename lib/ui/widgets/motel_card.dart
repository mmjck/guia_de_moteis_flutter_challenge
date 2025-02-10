import 'package:flutter/material.dart';
import 'package:guia_de_moteis/core/models/categoria_item.dart';
import 'package:guia_de_moteis/core/models/motel.dart';
import 'package:guia_de_moteis/core/models/periodo.dart';
import 'package:guia_de_moteis/core/models/suite.dart';
import 'package:guia_de_moteis/theme/colors.dart';
import 'package:guia_de_moteis/ui/widgets/image_icon.dart';
import 'package:guia_de_moteis/ui/widgets/row_price_element.dart';
import 'package:guia_de_moteis/ui/widgets/full_screen_modal.dart';
import 'package:guia_de_moteis/ui/widgets/primary_button.dart';
import 'package:guia_de_moteis/ui/widgets/tertiary_button.dart';
import 'package:guia_de_moteis/ui/widgets/custom_typography.dart';

class MotelCard extends StatelessWidget {
  final Motel data;

  const MotelCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTitle(),
        const SizedBox(
          height: 10,
        ),
        _buildSuite(),
      ],
    );
  }

  Widget _buildPrice(List<Periodo> periodos) {
    return Column(
      children: [
        ...periodos.map(
          (e) => Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              RowPrice(
                periodo: e,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSuite() {
    return SizedBox(
      height: 800,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.suites.length,
        itemBuilder: (context, index) {
          final item = data.suites[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: 400,
            child: Column(
              children: [
                _buildImage(item.nome, item.fotos.first),
                const SizedBox(
                  height: 10,
                ),
                if (item.exibirQtdDisponiveis) ..._buildAvailable(),
                _buildItems(item.categoriaItens, item.itens),
                _buildPrice(item.periodos),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildImage(String name, String path) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              height: 100,
              child: CustomTypography(
                text: name,
                variant: TypographyVariant.h1,
                align: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildAvailable() {
    return [
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 10,
            ),
            const CustomTypography(
              text: "indisponível no app",
              variant: TypographyVariant.h3,
              align: TextAlign.center,
              color: ThemeColors.purple,
              weight: FontWeight.bold,
            ),
            PrimaryButton(
              onPressed: () {},
              text: "avise-me",
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ].toList();
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarImageIcon(
                path: data.logo,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTypography(
                    text: data.fantasia,
                    variant: TypographyVariant.h2,
                    align: TextAlign.center,
                  ),
                  CustomTypography(
                    text: data.bairro,
                    variant: TypographyVariant.h2,
                    align: TextAlign.center,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: ThemeColors.yellow1,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 8,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: ThemeColors.yellow1,
                              ),
                              CustomTypography(
                                text: data.media.toStringAsPrecision(2),
                                variant: TypographyVariant.h4,
                                align: TextAlign.center,
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          CustomTypography(
                            text: "${data.qtdAvaliacoes} avaliações",
                            variant: TypographyVariant.h4,
                            align: TextAlign.center,
                            weight: FontWeight.bold,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          const Icon(
            Icons.favorite,
            color: Colors.grey,
            size: 35,
          )
        ],
      ),
    );
  }

  Widget _buildItems(
    List<CategoriaItem> categoryItem,
    List<Item> items,
  ) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Wrap(
              children: [
                ...categoryItem.take(4).map((e) {
                  return SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      e.icone,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              ],
            ),
          ),
          Builder(builder: (context) {
            return TertiaryButton(
              onPressed: () {
                _showBottomSheet(context, categoryItem, items);
              },
              text: "ver\ntodos",
            );
          })
        ],
      ),
    );
  }

  void _showBottomSheet(
    BuildContext context,
    List<CategoriaItem> itemsCategory,
    List<Item> items,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FullScreenModal(
          itemsCategory: itemsCategory,
          items: items,
        );
      },
    );
  }
}
