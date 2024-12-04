import 'package:pokemon/core/importer.dart';
import 'package:pokemon/core/pokemon_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: PokemonApp(),
    ),
  );
}
