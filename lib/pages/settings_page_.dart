import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_test_app/components/language_.dart';
import 'package:shoes_test_app/components/language_constants_.dart';
import 'package:shoes_test_app/components/widgets_helper_.dart';
import 'package:shoes_test_app/main.dart';

import 'package:shoes_test_app/theme/theme.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late List<bool> _isSelected; // late - определим позже переменную в коде

  static const List<ThemeMode> _themeModes = [
    ThemeMode.system,
    ThemeMode.light,
    ThemeMode.dark,
  ];

  void navigateToggleButtons(int index) {
    // for (int i = 0; i < _isSelected.length; i++) {
    //   _isSelected[i] = i == index;
    // }
    context.read<ThemeProvider>().setThemeMode(_themeModes[index]);
    _updateThemeMode();
  }

  void _updateThemeMode() {
    _isSelected = _themeModes.map<bool>((mode) {
      return mode == context.read<ThemeProvider>().themeMode;
    }).toList(); // получаем bool значения при сравнении какая тема сейчас установлена и возвращаем в кнопки
    // _isSelected = map(
    //     _themeModes, (mode) => mode == context.read<ThemeProvider>().themeMode);
  }

  // List<T> map<T, A>(List<A> items, T Function(A item) callback) {
  //   final List<T> result = [];
  //   for (final item in items) {
  //     result.add(callback(item));
  //   }
  //   return result;
  // }

  @override
  void initState() {
    super.initState();
    _updateThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    //final text = MediaQuery.of(context).platformBrightness == Brightness.dark       for the system mode theme
    // final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark // вместо єтого updateThemeMode
    //     ? 'Dark Theme Selected'
    //     : 'Light Theme Selected';

    context.watch<ThemeProvider>();
    // final text = context.watch<ThemeProvider>().themeMode == ThemeMode.dark
    //     ? 'Dark Theme Selected'
    //     : 'Light Theme Selected';

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.settings,
                    size: 95,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                thickness: 2,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              padding: const EdgeInsets.symmetric(horizontal: 57, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        translation(context).select_theme,
                        style: TextStyle(
                            color: isDark ? Colors.grey[300] : Colors.grey[700],
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      ToggleButtons(
                        isSelected: _isSelected,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        selectedBorderColor: Colors.red[700],
                        selectedColor: Colors.white,
                        fillColor: Colors.red[200],
                        color: Colors.red[400],
                        constraints: const BoxConstraints(
                          minHeight: 40.0,
                          minWidth: 80.0,
                        ),
                        onPressed: navigateToggleButtons,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10),
                            child: Icon(
                                Icons.system_security_update_good_outlined),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10),
                            child: Icon(Icons.light_mode_outlined),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10),
                            child: Icon(Icons.dark_mode_outlined),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 15),
                        child: Text(
                          'System',
                          style: TextStyle(
                              color:
                                  isDark ? Colors.grey[400] : Colors.grey[600],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          'Light',
                          style: TextStyle(
                              color:
                                  isDark ? Colors.grey[400] : Colors.grey[600],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Text(
                          'Dark',
                          style: TextStyle(
                              color:
                                  isDark ? Colors.grey[400] : Colors.grey[600],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            addVerticalSpace(5),
            //Text(text),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20.0),
            //   child: Text('Applying theme: $text'),
            // ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                thickness: 2,
              ),
            ),
            addVerticalSpace(5),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  addVerticalSpace(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        translation(context).select_language,
                        style: TextStyle(
                            color: isDark ? Colors.grey[300] : Colors.grey[700],
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  addVerticalSpace(20),
                  DropdownButton<Language>(
                    underline: SizedBox(),
                    icon: const Icon(Icons.language),
                    hint: Text(translation(context).dropDown_language),
                    iconSize: 25,
                    items: Language.languageList()
                        .map<DropdownMenuItem<Language>>(
                            (e) => DropdownMenuItem<Language>(
                                  value: e,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        e.flag,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        e.name,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ))
                        .toList(),
                    onChanged: (Language? language) async {
                      if (language != null) {
                        Locale _locale = await setLocale(language.languageCode);
                        MyApp.setLocale(context, _locale);
                      }
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                thickness: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
