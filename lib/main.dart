import 'package:expense_tracker/consts/color_const.dart';
import 'package:expense_tracker/services/init_provider.dart';
import 'package:expense_tracker/view/dashboard/dashboard.dart';
import 'package:expense_tracker/view/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("jsonDataBox");
  runApp(AppProviders.initializeProvider(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: Color(0xfff2f5f6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xfffefffe),
          tertiary: const Color(4285684748),
          onTertiary: const Color(4294967295),
          tertiaryContainer: const Color(4294959238),
          onTertiaryContainer: const Color(4280490752),
        ),
        useMaterial3: true,
      ),
      home:  const OnboardingView(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: colors.gradientColor,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(15)),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
