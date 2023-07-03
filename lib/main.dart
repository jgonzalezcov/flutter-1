import 'package:desafio/pages/home.page.dart';
import 'package:desafio/pages/setting.page.dart';
import 'package:desafio/widget/navigation.widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _currentPage = 0; //   int _currentPage = 0;
  String _bgImg = 'assets/imgs/fondopantalla.jpeg';
  int _factor = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_bgImg),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Builder(builder: (BuildContext c) {
                  return _currentPage == 1
                      ? SettingPage(
                          factorNum: (int factorSelect) {
                            setState(() {
                              _factor = factorSelect;
                            });
                          },
                        )
                      : HomePage(
                          bgImage: (String bgSelect) {
                            setState(() {
                              _bgImg = bgSelect;
                            });
                          },
                          factorNum: _factor,
                        );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationWidget(setView: (int currentPage) {
        setState(() {
          _currentPage = currentPage;
        });
      }),
    );
  }
}
