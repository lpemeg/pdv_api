import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:pdv_api/components/global.dart';
import 'package:pdv_api/components/tema.dart';
import 'package:pdv_api/view/login/login_view.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final globalCtl = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PDV',
      theme: temaClaro,
      darkTheme: temaEscuro,
      home: LoginView(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        SfGlobalLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      locale: const Locale('pt', 'BR'),
      fallbackLocale: const Locale('pt', 'BR'),
    );
  }
}
