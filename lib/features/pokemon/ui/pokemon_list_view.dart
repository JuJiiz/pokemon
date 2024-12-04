import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokemon/core/importer.dart';
import 'package:pokemon/features/pokemon/domain/models/pokemon_entity.dart';

class PokemonListView extends StatelessWidget {
  final PokemonEntity entity;
  final void Function(PokemonEntity entity) onTap;

  const PokemonListView({
    super.key,
    required this.entity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: InkWell(
        onTap: () => onTap(entity),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  '#${entity.id}',
                  style: font500$14.copyWith(color: appOnWhiteColor),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CachedNetworkImage(
                    imageUrl: entity.imageUrl,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    entity.name,
                    style: font400$16.copyWith(color: appOnWhiteColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
