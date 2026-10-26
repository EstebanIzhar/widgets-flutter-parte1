import 'package:flutter/material.dart';

import 'widgets/button_widget.dart';
import 'widgets/checkbox_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exploración de Widgets',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const WidgetDemoPage(),
    );
  }
}

class WidgetDemoPage extends StatefulWidget {
  const WidgetDemoPage({super.key});

  @override
  State<WidgetDemoPage> createState() => _WidgetDemoPageState();
}

class _WidgetDemoPageState extends State<WidgetDemoPage> {
  bool aceptado = false;
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exploración de Widgets')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Widgets de Flutter',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              const Text('1. ElevatedButton', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              ButtonWidget(
                onPressed: () {
                  setState(() {
                    contador++;
                  });
                },
              ),
              const SizedBox(height: 12),
              Text('Veces presionado: $contador'),
              const Divider(height: 40),
              const Text('2. Checkbox', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Center(
                child: CheckboxWidget(
                  value: aceptado,
                  onChanged: (nuevoValor) {
                    setState(() {
                      aceptado = nuevoValor ?? false;
                    });
                  },
                ),
              ),
              Text(aceptado ? 'Opción seleccionada' : 'Opción no seleccionada'),
            ],
          ),
        ),
      ),
    );
  }
}
