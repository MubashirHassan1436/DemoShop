import 'package:flutter/material.dart';

import 'app_theme/theme.dart';
import 'route_settings/route.dart';
import 'screens/main_page.dart';
import 'screens/product_detail_page.dart';
import 'widgets/custom_route.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Shop',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: Theme.of(context).textTheme,
      ),
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings) {
        if ((settings.name??"").contains('detail')) {
          return CustomRoute<bool>(
              builder: (BuildContext context) => const ProductDetailPage());
        } else {
          return CustomRoute<bool>(
              builder: (BuildContext context) => const MainPage());
        }
      },
      initialRoute: "MainPage",
    );
  }
}
