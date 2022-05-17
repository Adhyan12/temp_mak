import 'package:project_mak/router/route_generator.dart';
import 'package:project_mak/services/user_provider.dart';
import 'package:project_mak/utility/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:stacked_themes/stacked_themes.dart';

Future main() async {
  await ThemeManager.initialise();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
      ],
      child: KeyboardDismissOnTap(
        child: ThemeBuilder(
          defaultThemeMode: ThemeMode.light,
          darkTheme: lightTheme,
          lightTheme: lightTheme,
          builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
            title: 'Flutter Demo',
            theme: regularTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        ),
      ),
    );
  }
}
