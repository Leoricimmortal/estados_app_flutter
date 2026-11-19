// Realizado por Ricardo Castro de Matos

import 'package:material_ui/material_ui.dart';

import 'telas/tela_detached.dart';
import 'telas/tela_resumed.dart';
import 'telas/tela_inactive.dart';
import 'telas/tela_hidden.dart';
import 'telas/tela_paused.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ciclo de Vida Android',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  void abrirTela(BuildContext context, Widget tela) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return tela;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar removido e body envolvido em SafeArea
      // para não colar nas bordas do sistema
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Caso queira usar imagem personalizada,
                // descomente a linha abaixo e comente o Icon:

                /*
                Center(
                  child: Image.asset(
                    'assets/logo_celular.png',
                    height: 75,
                  ),
                ),
                */

                const Icon(
                  Icons.phone_android,
                  size: 75,
                  color: Colors.blue,
                ),

                const SizedBox(height: 15),

                const Text(
                  'ESTADOS DO CICLO DE VIDA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                // 1 - DETACHED
                botaoEstado(
                  context: context,
                  nome: 'Desconectado (DETACHED)',
                  descricao:
                      'Aplicativo sem ligação ativa com uma visualização da plataforma.',
                  cor: const Color(0xFF455A64),
                  tela: const TelaDetached(),
                ),

                // 2 - RESUMED
                botaoEstado(
                  context: context,
                  nome: 'Em execução (RESUMED)',
                  descricao:
                      'Aplicativo em primeiro plano e interativo.',
                  cor: const Color(0xFF2E7D32),
                  tela: const TelaResumed(),
                ),

                // 3 - INACTIVE
                botaoEstado(
                  context: context,
                  nome: 'Inativo (INACTIVE)',
                  descricao: 'Aplicativo sem foco de interação.',
                  cor: const Color(0xFFF9A825),
                  tela: const TelaInactive(),
                ),

                // 4 - HIDDEN
                botaoEstado(
                  context: context,
                  nome: 'Oculto (HIDDEN)',
                  descricao: 'Interface do aplicativo está oculta.',
                  cor: const Color(0xFF6A1B9A),
                  tela: const TelaHidden(),
                ),

                // 5 - PAUSED
                botaoEstado(
                  context: context,
                  nome: 'Pausado (PAUSED)',
                  descricao:
                      'Aplicativo em segundo plano, sem atualização normal da interface.',
                  cor: const Color(0xFFC62828),
                  tela: const TelaPaused(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget botaoEstado({
    required BuildContext context,
    required String nome,
    required String descricao,
    required Color cor,
    required Widget tela,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: cor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            abrirTela(context, tela);
          },
          child: Column(
            children: [
              Text(
                nome,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                descricao,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
