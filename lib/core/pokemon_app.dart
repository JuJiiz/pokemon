import 'package:pokemon/core/app_routing.dart';
import 'package:pokemon/core/importer.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokemon',
      theme: appTheme,
      routerConfig: appRouter,
    );
  }
}
