import 'package:flutter/material.dart';
import 'package:guia_de_moteis/providers/motels_provider.dart';
import 'package:guia_de_moteis/theme/colors.dart';
import 'package:guia_de_moteis/ui/widgets/app_bar.dart';
import 'package:guia_de_moteis/ui/widgets/motel_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: HeaderAppBar(),
        ),
        backgroundColor: ThemeColors.background,
        body: Container(
          child: (Provider.of<MotelsProvider>(context).isLoading)
              ? const Center(
                  child: CircularProgressIndicator(
                    color: ThemeColors.header,
                  ),
                )
              : SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [_buildItems()],
                  ),
                ),
        ));
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MotelsProvider>(context, listen: false).fetchData();
    });
  }

  Widget _buildItems() {
    if (Provider.of<MotelsProvider>(context).data == null) {
      return const Center();
    }

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        ...Provider.of<MotelsProvider>(context).data!.moteis.map(
              (e) => MotelCard(data: e),
            ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
