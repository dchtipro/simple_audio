import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    AudioServiceWidget(
      child: GetMaterialApp(
        title: "AudioPlayer",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          accentColor: Color(0xFFFF9E27),
        ),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
