import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/theme_provider.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final Icon switchIcon = Icon(themeProvider.isDarkMode ? CupertinoIcons.moon_stars_fill : CupertinoIcons.sun_max_fill);
    
    return IconButton(
        onPressed: () {
          themeProvider.toggleTheme();
        },
        icon: switchIcon);
  }
}
