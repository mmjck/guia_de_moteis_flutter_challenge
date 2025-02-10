import 'package:flutter/material.dart';
import 'package:guia_de_moteis/core/models/categoria_item.dart';
import 'package:guia_de_moteis/core/models/suite.dart';

class FullScreenModal extends StatelessWidget {
  final List<CategoriaItem> itemsCategory;
  final List<Item> items;
  const FullScreenModal({
    super.key,
    required this.itemsCategory,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "suíte luxo tv",
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildSectionTitle("principais itens"),
                    const SizedBox(height: 40),
                    Wrap(
                      runSpacing: 20,
                      spacing: 20,
                      alignment: WrapAlignment.center,
                      children: [
                        ...itemsCategory.map((e) {
                          return _buildFeatureItem(e);
                        })
                      ],
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 20),
                    _buildSectionTitle("tem também"),
                    const SizedBox(height: 40),
                    _buildText(),
                    const SizedBox(height: 20),
                  ])
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    String str = items.map((item) => item.nome).join(" | ");
    return Text(
      str,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }

  Widget _buildFeatureItem(CategoriaItem item) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(
          item.icone,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 10),
        Text(item.nome.toLowerCase(),
            style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(thickness: 1, color: Colors.grey.shade300)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        Expanded(child: Divider(thickness: 1, color: Colors.grey.shade300)),
      ],
    );
  }
}
