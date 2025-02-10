import 'package:flutter/material.dart';
import 'package:guia_de_moteis/app.dart';
import 'package:guia_de_moteis/core/services/motels_service.dart';
import 'package:guia_de_moteis/providers/motels_provider.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MotelsProvider(
            service: MotelsService(
              http.Client(),
            ),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
