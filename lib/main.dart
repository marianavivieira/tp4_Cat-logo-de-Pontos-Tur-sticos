
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),
      home: const TelaCatalogo(),
    );
  }
}

class PontoTuristico {
  final String nome;
  final String cidade;
  final String imagem;
  final String descricao;

  const PontoTuristico({
    required this.nome,
    required this.cidade,
    required this.imagem,
    required this.descricao,
  });
}

class TelaCatalogo extends StatelessWidget {
  const TelaCatalogo({super.key});

  final List<PontoTuristico> pontos = const [
    PontoTuristico(
      nome: 'Jardim da Orla',
      cidade: 'Santos',
      imagem: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
      descricao: 'Jardins à beira-mar que são um dos cartões-postais de Santos.',
    ),
    PontoTuristico(
      nome: 'Museu do Café',
      cidade: 'Santos',
      imagem: 'https://images.unsplash.com/photo-1445116572660-236099ec97a0',
      descricao: 'Museu que conta a história do café e sua importância no Brasil.',
    ),
    PontoTuristico(
      nome: 'Morro do Maluf',
      cidade: 'Guarujá',
      imagem: 'https://images.unsplash.com/photo-1518837695005-2083093ee35b',
      descricao: 'Mirante com vista para a Praia da Enseada.',
    ),
    PontoTuristico(
      nome: 'Parque Estadual Xixová-Japuí',
      cidade: 'São Vicente',
      imagem: 'https://images.unsplash.com/photo-1473116763249-2faaef81ccda',
      descricao: 'Área de conservação com Mata Atlântica e paisagens naturais.',
    ),
    PontoTuristico(
      nome: 'Fortaleza de Itaipu',
      cidade: 'Praia Grande',
      imagem: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b',
      descricao: 'Fortificação histórica localizada no litoral paulista.',
    ),
    PontoTuristico(
      nome: 'Forte São João',
      cidade: 'Bertioga',
      imagem: 'https://images.unsplash.com/photo-1469474968028-56623f02e42e',
      descricao: 'Construção histórica ligada à colonização portuguesa.',
    ),
    PontoTuristico(
      nome: 'Cama de Anchieta',
      cidade: 'Itanhaém',
      imagem: 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
      descricao: 'Formação rochosa costeira associada à história de Anchieta.',
    ),
  ];

  Widget criarCard(PontoTuristico ponto) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              ponto.imagem,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 180,
                  color: Colors.teal.shade50,
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 45,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Text(
            ponto.nome,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.teal),
              const SizedBox(width: 4),
              Text(ponto.cidade),
            ],
          ),
          const SizedBox(height: 8),
          Text(ponto.descricao),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Mariana Vieira'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.teal.shade50,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Descubra a Baixada Santista!',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Conheça lugares incríveis da nossa região.',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          for (PontoTuristico ponto in pontos)
            criarCard(ponto),
        ],
      ),
    );
  }
}
