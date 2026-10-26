
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const TelaCatalogo(),
    );
  }
}

class PontoTuristico {
  final String nome;
  final String cidade;
  final String descricao;
  final String imagem;
  bool favorito;
  bool visitado;

  PontoTuristico({
    required this.nome,
    required this.cidade,
    required this.descricao,
    required this.imagem,
    this.favorito = false,
    this.visitado = false,
  });
}

class TelaCatalogo extends StatefulWidget {
  const TelaCatalogo({super.key});

  @override
  State<TelaCatalogo> createState() => _TelaCatalogoState();
}

class _TelaCatalogoState extends State<TelaCatalogo> {
  final List<PontoTuristico> pontosTuristicos = [
    PontoTuristico(
      nome: 'Jardim da Orla',
      cidade: 'Santos',
      descricao:
          'Um dos jardins de praia mais conhecidos do mundo, ideal para caminhar e apreciar o mar.',
      imagem:
          'https://images.unsplash.com/photo-1500375592092-40eb2168fd21',
    ),
    PontoTuristico(
      nome: 'Museu do Café',
      cidade: 'Santos',
      descricao:
          'Localizado no antigo edifício da Bolsa Oficial do Café, conta a história do café no Brasil.',
      imagem:
          'https://images.unsplash.com/photo-1445116572660-236099ec97a0',
    ),
    PontoTuristico(
      nome: 'Morro do Maluf',
      cidade: 'Guarujá',
      descricao:
          'Um mirante com vista para a Praia da Enseada e para o litoral de Guarujá.',
      imagem:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
    ),
    PontoTuristico(
      nome: 'Parque Estadual Xixová-Japuí',
      cidade: 'São Vicente',
      descricao:
          'Área de preservação ambiental com Mata Atlântica, trilhas e paisagens naturais.',
      imagem:
          'https://images.unsplash.com/photo-1448375240586-882707db888b',
    ),
    PontoTuristico(
      nome: 'Fortaleza de Itaipu',
      cidade: 'Praia Grande',
      descricao:
          'Construção histórica de defesa militar situada em uma região de belas paisagens.',
      imagem:
          'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b',
    ),
    PontoTuristico(
      nome: 'Forte São João',
      cidade: 'Bertioga',
      descricao:
          'Uma das fortificações mais antigas do Brasil, com importância histórica e cultural.',
      imagem:
          'https://images.unsplash.com/photo-1469474968028-56623f02e42e',
    ),
    PontoTuristico(
      nome: 'Cama de Anchieta',
      cidade: 'Itanhaém',
      descricao:
          'Formação rochosa à beira-mar associada à história do Padre José de Anchieta.',
      imagem:
          'https://images.unsplash.com/photo-1519046904884-53103b34b206',
    ),
  ];

  Widget criarCard(PontoTuristico ponto) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            ponto.imagem,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 180,
                width: double.infinity,
                color: Colors.teal.shade50,
                child: const Icon(
                  Icons.image_not_supported,
                  size: 50,
                  color: Colors.teal,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    const Icon(
                      Icons.location_on,
                      color: Colors.teal,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(ponto.cidade),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  ponto.descricao,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 8),
                const Divider(),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Favorito'),
                  secondary: const Icon(Icons.star_outline),
                  value: ponto.favorito,
                  activeColor: Colors.teal,
                  onChanged: (bool? valor) {
                    setState(() {
                      ponto.favorito = valor ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Já visitei'),
                  secondary: const Icon(Icons.check_circle_outline),
                  value: ponto.visitado,
                  activeColor: Colors.teal,
                  onChanged: (bool? valor) {
                    setState(() {
                      ponto.visitado = valor ?? false;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mariana Vieira'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.teal.shade50,
            child: const Column(
              children: [
                Text(
                  'Descubra a Baixada Santista!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Conheça lugares especiais e marque seus favoritos e os que já visitou.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pontosTuristicos.length,
              itemBuilder: (context, index) {
                return criarCard(pontosTuristicos[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
