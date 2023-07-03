import 'package:desafio/widget/goku.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key, required this.factorNum});
  final Function(int) factorNum;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

bool _viewGoku = false;

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        const SizedBox(height: 50.0),
        const Text(
          '¿Cuanto vas a incrementar?',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 300,
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+$')),
                  LengthLimitingTextInputFormatter(10),
                ],
                style: const TextStyle(color: Color.fromARGB(255, 28, 58, 223)),
                onChanged: (value) => {
                  setState(() {
                    value != ''
                        ? int.tryParse(value) != null
                            ? widget.factorNum(int.parse(value))
                            : null
                        : widget.factorNum(1);
                  })
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '1,2,3...',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 39, 38, 38)),
                ),
              ),
            )),
        ClipOval(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  _viewGoku = !_viewGoku;
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
                child: Center(
                  child: Text(
                    _viewGoku ? 'Ocultar' : 'Mostrar',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        _viewGoku
            ? const Goku()
            : const SizedBox(
                height: 0,
              ),
      ],
    ));
  }
}
