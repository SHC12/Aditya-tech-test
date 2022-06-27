import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null);
  Intl.systemLocale = 'id_ID';
  var initialRoute = await Routes.initialRoute;
  runApp(LayoutBuilder(builder: (context, containr) {
    return Main(initialRoute);
  }));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        initialRoute: initialRoute,
        getPages: Nav.routes,
        debugShowCheckedModeBanner: false,
        title: "Aditya Movie",
      );
    });
  }
}
