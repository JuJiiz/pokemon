import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon/features/pokemon/data/models/pokemon_raw.dart';

part 'pokemon_list_response_raw.freezed.dart';

part 'pokemon_list_response_raw.g.dart';

@Freezed(
  toJson: false,
  fromJson: true,
)
class PokemonListResponseRaw with _$PokemonListResponseRaw {
  const factory PokemonListResponseRaw({
    @JsonKey(name: "count") required int? count,
    @JsonKey(name: "next") required String? next,
    @JsonKey(name: "previous") required String? previous,
    @JsonKey(name: "results") required List<PokemonRaw>? results,
  }) = _PokemonListResponseRaw;

  factory PokemonListResponseRaw.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseRawFromJson(json);
}
