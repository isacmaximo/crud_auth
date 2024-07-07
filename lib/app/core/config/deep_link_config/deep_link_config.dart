import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeepLinkConfig extends Disposable {
  late AppLinks _appLinks;
  late StreamSubscription<Uri>? _linkSubscription;

  // Instância singleton
  static final DeepLinkConfig _instance = DeepLinkConfig._internal();

  // Construtor privado
  DeepLinkConfig._internal();

  // Método factory para retornar a instância singleton
  factory DeepLinkConfig() {
    return _instance;
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    // Handle initial link
    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      print('INITIAL URI: $initialUri');
      openAppLink(initialUri);
    }

    // Handle incoming links
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      print('onAppLink: $uri');
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    // Navegue com base no URI
    if (uri.pathSegments.isNotEmpty) {
      final path = uri.pathSegments.join('/');
      print('CAMINHO URL=> $path');
      // FAZER ALGUMA COISA AQUI
      Modular.to.pushNamed('/app');
    }
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
  }
}
