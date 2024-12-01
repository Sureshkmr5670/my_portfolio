import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:json_theme/json_theme.dart';
import 'package:my_portfolio/common/widgets/mesh_gradient.dart';
import 'package:my_portfolio/data/services/portfolio_service.dart';
import 'package:my_portfolio/features/authentication/controllers/navigation_index.dart';
import 'package:my_portfolio/features/authentication/controllers/portfolio_provider.dart';
import 'package:my_portfolio/portfolio.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load light and dark theme JSONs
  final lightThemeStr = await rootBundle.loadString('assets/light_theme.json');
  final darkThemeStr = await rootBundle.loadString('assets/dark_theme.json');

  final lightThemeJson = jsonDecode(lightThemeStr);
  final darkThemeJson = jsonDecode(darkThemeStr);

  final lightTheme = ThemeDecoder.decodeThemeData(lightThemeJson)!;
  final darkTheme = ThemeDecoder.decodeThemeData(darkThemeJson)!;

  final portfolioService = PortfolioService();
  final portfolioProvider =
      PortfolioProvider(portfolioService: portfolioService);

  try {
    await portfolioProvider.initializeData();
  } catch (e) {
    // Handle initialization errors
    print('Initialization error: $e');
  }

  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);
  FlutterNativeSplash.remove();

  runApp(
    ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MyApp(
        portfolioService: portfolioService,
        portfolioProvider: portfolioProvider,
        lightTheme: lightTheme,
        darkTheme: darkTheme,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final PortfolioService portfolioService;
  final PortfolioProvider portfolioProvider;
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  const MyApp({
    super.key,
    required this.portfolioService,
    required this.portfolioProvider,
    required this.lightTheme,
    required this.darkTheme,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => MultiProvider(
        providers: [
          Provider<PortfolioService>.value(
            value: portfolioService,
          ),
          ChangeNotifierProvider<PortfolioProvider>.value(
            value: portfolioProvider,
          ),
        ],
        child: GetMaterialApp(
          title: 'Portfolio Website',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system, // Automatically switch based on system setting
          home:
              Scaffold(body: MeshGradientBackground(child: PortfolioScreen())),
        ),
      ),
    );
  }
}
