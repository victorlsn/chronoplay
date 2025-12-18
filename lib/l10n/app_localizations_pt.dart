// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'ChronoPlay';

  @override
  String get homeReadyTitle => 'Pronto para jogar?';

  @override
  String get homeSubtitle => 'Escaneie uma carta, coloque o celular com a tela para baixo\ne escute com atenção.';

  @override
  String get homeStartGame => 'Iniciar jogo';

  @override
  String get homeHowToPlay => 'Como jogar';

  @override
  String get faceDownTitle => 'Prepare-se';

  @override
  String get faceDownInstruction => 'Coloque o celular com a tela para baixo';

  @override
  String get faceDownSubtitle => 'A música começará automaticamente';

  @override
  String get howToPlayTitle => 'Como jogar';

  @override
  String get howToPlayCoreRules => 'Regras básicas';

  @override
  String get howToPlayOptionalTokens => 'Opcional: Fichas';

  @override
  String get howToPlayTagline => 'Construa sua linha do tempo musical e reviva os momentos.';

  @override
  String get ruleStartCard => 'Cada jogador começa com uma carta de música posicionada à sua frente.';

  @override
  String get ruleScanCard => 'Escaneie uma nova carta\nAponte a câmera para o QR code para iniciar a música.';

  @override
  String get ruleFaceDown => 'Coloque o celular com a tela para baixo\nA música começará automaticamente.';

  @override
  String get ruleListen => 'Escute com atenção\nNada de espiar o título ou o ano.';

  @override
  String get ruleTimeline => 'Coloque a carta na sua linha do tempo\nDecida se ela vem antes, depois ou entre as cartas que você já tem.';

  @override
  String get ruleReveal => 'Vire a carta para revelar o ano\nSe você acertar a posição, fica com a carta.';

  @override
  String get ruleWin => 'O primeiro jogador a chegar a 10 cartas vence o jogo.';

  @override
  String get tokensIntro => 'Para um jogo mais estratégico, os jogadores podem usar fichas.';

  @override
  String get tokenSkip => 'No seu turno:\nGaste 1 ficha para pular a música atual e comprar uma nova carta.';

  @override
  String get tokenSteal => 'No turno de um oponente:\nColoque uma ficha na linha do tempo dele se achar que a carta foi posicionada incorretamente.\nSe estiver certo, roube a carta.';

  @override
  String get tokenTrade => 'A qualquer momento:\nTroque 3 fichas por uma carta do baralho e coloque-a diretamente na sua linha do tempo.';

  @override
  String get tokenEarn => 'Ganhando fichas:\nDiga corretamente o nome da música e do artista para ganhar 1 ficha, mesmo se errar a posição da carta.\nMáximo: 5 fichas por jogador.';

  @override
  String get playerListening => 'Ouvindo';

  @override
  String get playerNextCard => 'Próxima carta';

  @override
  String get scannerTitle => 'Escanear carta';
}
