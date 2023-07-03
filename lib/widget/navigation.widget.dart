import 'package:flutter/material.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget(
      {super.key, required this.setView}); // required this.setView
  final Function(int) setView; // final Function(int) setView;

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey.shade400,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          label: 'Contador',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configuración',
        ),
      ],
      onTap: (int index) {
        // Acción a realizar cuando se selecciona un elemento del BottomNavigationBar

        widget.setView(index); // widget.setView(index);
      },
    );
  }
}
