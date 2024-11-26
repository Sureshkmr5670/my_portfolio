import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_portfolio/common/widgets/mesh_gradient.dart';
import 'package:my_portfolio/data/services/portfolio_service.dart';
import 'package:my_portfolio/features/authentication/controllers/navigation_index.dart';
import 'package:my_portfolio/features/authentication/controllers/portfolio_provider.dart';
import 'package:my_portfolio/portfolio.dart';
import 'package:my_portfolio/utils/theme/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  // Ensure this is called only once
  WidgetsFlutterBinding.ensureInitialized();

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
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final PortfolioService portfolioService;
  final PortfolioProvider portfolioProvider;

  const MyApp({
    super.key,
    required this.portfolioService,
    required this.portfolioProvider,
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
          theme: CustomAppTheme.lightTheme,
          darkTheme: CustomAppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          home:
              Scaffold(body: MeshGradientBackground(child: PortfolioScreen())),
        ),
      ),
    );
  }
}
