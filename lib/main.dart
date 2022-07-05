import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie2/app/core/core_bind.dart';
import 'package:movie2/app/routes.dart';

main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.red,
        backgroundColor: Colors.white,
      ),
      initialBinding: CoreBind(),
      initialRoute: '/splash',
      getPages: appRoutes,
    ),
  );
}
