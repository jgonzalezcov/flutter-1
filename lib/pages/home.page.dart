import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.bgImage, required this.factorNum});
  final Function(String) bgImage;
  final int factorNum;
  @override
  State<HomePage> createState() => _HomePageState();
}

int _counter = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 80.0),
          const Text(
            'Cambiar el fondo',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  widget.bgImage('assets/imgs/fondopantalla.jpeg');
                },
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/imgs/fondopantalla.jpeg'),
                    radius: 28,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  widget.bgImage('assets/imgs/fondopantalla2.jpg');
                },
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/imgs/fondopantalla2.jpg'),
                    radius: 28,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 80.0),
          Text(
            '$_counter',
            style: const TextStyle(
              fontSize: 120,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _counter - widget.factorNum >= 0
                            ? _counter = _counter - widget.factorNum
                            : _counter = 0;
                      });
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.15), // Color blanco semitransparente
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '-',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _counter = 0;
                      });
                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.15), // Color blanco semitransparente
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          'Limpiar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _counter = _counter + widget.factorNum;
                      });
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.15), // Color blanco semitransparente
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '+',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
