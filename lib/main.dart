import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'UI/Helper/theme_switcher.dart';
import 'package:provider/provider.dart';
import 'package:course_a_fixed/Provider/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      )
    ], child: const Start()),
  );
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course A',
      locale: Locale('en'),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: MyCourseHome(),
    );
  }
}

class MyCourseHome extends StatefulWidget {
  const MyCourseHome({Key? key}) : super(key: key);

  @override
  State<MyCourseHome> createState() => _MyCourseHomeState();
}

class _MyCourseHomeState extends State<MyCourseHome> {
  String appLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
        backgroundColor: themeProvider.isDarkMode ? const Color.fromARGB(255, 17, 27, 37) : const Color.fromARGB(255, 241, 244, 248),
        appBar: AppBar(actions: [
          const ThemeSwitcher(),
          IconButton(
              onPressed: () {
                appLanguage = appLanguage == 'en' ? 'fa' : 'en';
              },
              icon: const Icon(Icons.language)),
        ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.helloWorld,
                style: TextStyle(color: themeProvider.isDarkMode ? Colors.white70 : Colors.black54),
              ),
              const SizedBox(height: 10),
              Text(
                'Theme is ${themeProvider.themeMode.toString().substring(themeProvider.themeMode.toString().indexOf('.') + 1)}',
                style: TextStyle(color: themeProvider.isDarkMode ? Colors.white70 : Colors.black54),
              )
            ],
          ),
        ),
      );
    });
  }
}

// class MyCourseHome extends StatefulWidget {
//   const MyCourseHome({Key? key}) : super(key: key);
//
//   @override
//   State<MyCourseHome> createState() => _MyCourseHomeState();
// }
//
// class _MyCourseHomeState extends State<MyCourseHome> {
//   @override
//   Widget build(BuildContext mainContext) {
//     return Consumer<ThemeProvider>(
//       builder: (context, themeProvider, child) {
//         return MaterialApp(
//           locale: const Locale('en',''),
//           localizationsDelegates: const [
//             AppLocalizations.delegate,
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//           ],
//           supportedLocales: AppLocalizations.supportedLocales,
//           debugShowCheckedModeBanner: false,
//           themeMode: themeProvider.themeMode,
//           theme: MyThemes.appLightTheme,
//           darkTheme: MyThemes.appDarkTheme,
//           home: Scaffold(
//             appBar: AppBar(
//               actions: const [ThemeSwitcher()],
//             ),
//             body:
//                 // Text('Theme is ${themeProvider.themeMode.toString().substring(themeProvider.themeMode.toString().indexOf('.') + 1)}'),
//                 Center(
//                     child: Text('${AppLocalizations.of(mainContext)?.themeText}'),
//                 )
//
//           ),
//         );
//       },
//     );
//   }
// }
