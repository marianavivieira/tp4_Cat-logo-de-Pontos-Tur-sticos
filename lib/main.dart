
import 'package:flutter/material.dart';

// Aluna: Mariana Vieira

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo Turístico',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mariana Vieira'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Text(
            'Catálogo de Pontos Turísticos da Baixada Santista',
          ),
        ),
      ),
    );
  }
}
