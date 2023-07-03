import 'package:flutter/material.dart';

class Goku extends StatelessWidget {
  const Goku({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(
          '"Hola, soy Goku"',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        SizedBox(
          height: 10,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/imgs/gokuDevelop.png'),
          radius: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          textAlign: TextAlign.center,
          'Utilice onChanged para guardar el número, ya que el botón decía mostrar, por lo cual el botón perdía el sentido de su existencia y por eso agregue este mensaje de Goku',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
