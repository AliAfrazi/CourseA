import 'package:course_a_fixed/Provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'UI/Helper/theme_switcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      )
    ], child: const MyCourseHome()),
  );
}

class MyCourseHome extends StatefulWidget {
  const MyCourseHome({Key? key}) : super(key: key);

  @override
  State<MyCourseHome> createState() => _MyCourseHomeState();
}

class _MyCourseHomeState extends State<MyCourseHome> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.appLightTheme,
          darkTheme: MyThemes.appDarkTheme,
          home: Scaffold(
            appBar: AppBar(
              actions: const [ThemeSwitcher()],
            ),
            body: Center(
              child: Text('Theme is ${themeProvider.themeMode.toString().substring(themeProvider.themeMode.toString().indexOf('.') + 1)}'),
            ),
          ),
        );
      },
    );
  }
}
