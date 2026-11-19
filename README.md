# Estados do Ciclo de Vida — Flutter

Aplicativo Flutter didático que apresenta os **cinco estados do ciclo de vida** de um app (`AppLifecycleState`). Cada estado tem um botão na tela inicial que abre uma tela própria, com cor, ícone e uma breve explicação.

> O app é ilustrativo: as telas **explicam** cada estado, mas não detectam em tempo real o estado em que o aplicativo está.

## Estados apresentados

| Estado | Nome em português | Descrição | Cor |
|---|---|---|---|
| `detached` | Desconectado | Aplicativo sem ligação ativa com uma visualização da plataforma. | Cinza-azulado `#455A64` |
| `resumed` | Em execução | Aplicativo em primeiro plano e interativo. | Verde `#2E7D32` |
| `inactive` | Inativo | Aplicativo sem foco de interação. | Amarelo `#F9A825` |
| `hidden` | Oculto | Interface do aplicativo está oculta. | Roxo `#6A1B9A` |
| `paused` | Pausado | Aplicativo em segundo plano, sem atualização normal da interface. | Vermelho `#C62828` |

## Funcionalidades

- Tela inicial com um botão colorido para cada estado, com nome e descrição.
- Uma tela dedicada por estado, com ícone, título e texto explicativo.
- Botão de voltar redondo no canto superior esquerdo de cada tela.
- Layout com Material 3, `SafeArea` e rolagem para caber em telas pequenas.

## Estrutura do projeto

```
lib/
├── main.dart                 # App, tema e tela inicial com os botões
└── telas/
    ├── tela_detached.dart
    ├── tela_resumed.dart
    ├── tela_inactive.dart
    ├── tela_hidden.dart
    └── tela_paused.dart
test/
└── widget_test.dart          # Testes de widget da navegação
```

## Tecnologias

- [Flutter](https://flutter.dev) / Dart (SDK `^3.14.0`)
- Material 3 (`material_ui`)
- `flutter_lints` para análise estática

## Como executar

Pré-requisito: [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado.

```bash
# Instalar as dependências
flutter pub get

# Rodar o app (emulador ou dispositivo conectado)
flutter run
```

## Testes

```bash
flutter test
```

Os testes verificam que:

- a tela inicial exibe o título e os cinco botões de estado;
- o botão **Oculto (HIDDEN)** abre a tela correspondente e o botão de voltar retorna à tela inicial.

## Autor

Desenvolvido por **Ricardo Castro de Matos**.
