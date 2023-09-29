import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_test_app/components/cart_.dart';
import 'package:shoes_test_app/components/cart_item_.dart';
import 'package:shoes_test_app/components/language_constants_.dart';
import 'package:shoes_test_app/l10n/l10n.dart';
import 'package:shoes_test_app/components/auth_scope.dart';
import 'package:shoes_test_app/pages/cart_page_.dart';
import 'package:shoes_test_app/theme/theme.dart';
import 'pages/home_page_.dart';
import 'pages/intro_page_.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  final List<String> cartItemsRaw = prefs.getStringList('cart') ?? [];
  final List<CartItem> cartItems = cartItemsRaw
      .map(
        (e) => CartItem.fromJson(jsonDecode(e)),
      )
      .toList();
  runApp(MyApp(initialCartItems: cartItems));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.initialCartItems});
  final List<CartItem> initialCartItems;

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) =>
                Cart(initialCartItems: widget.initialCartItems),
          ),
        ],
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          // style text field (ДОДЕЛАТЬ)
          return MaterialApp(
            //__________________________localization
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: L10n.all,
            locale: _locale,
            title: 'Shoes material app',
            themeMode: themeProvider.themeMode,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            builder: (context, child) {
              return StreamBuilder<User?>(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (context, snapshot) {
                  return AuthScope(
                    user: snapshot.data,
                    child: child ?? const SizedBox.shrink(),
                  );
                },
              );
            },
            routes: {
              '/': (context) => const IntroPage_(),
              '/home_page': (context) => HomePage(),
              '/cart_page': (context) => CartPage_(),
              '/intropage': (context) => const IntroPage_(),
            },
          );
        },
      );
}
