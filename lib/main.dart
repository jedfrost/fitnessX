import 'package:fitnessx/app/app_provider.dart';
import 'package:fitnessx/app/app_theme.dart';
import 'package:fitnessx/gen/l10n/app_localizations.dart';
import 'package:fitnessx/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const StateProviderApp());
}


final scafoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final navigatorKey = GlobalKey<NavigatorState>();

class StateProviderApp extends StatelessWidget {
  const StateProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx)=> AppProvider()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: scafoldMessengerKey,
        navigatorKey: navigatorKey,
        theme: AppTheme.lightTheme,
        
        darkTheme: AppTheme.darkTheme,
        onGenerateRoute: Routes.generateRoutes,
        initialRoute: Routes.splash,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
