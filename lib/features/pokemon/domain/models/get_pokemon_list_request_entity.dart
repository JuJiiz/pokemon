class GetPokemonListRequestEntity {
  final int offset;
  final int perPage;

  const GetPokemonListRequestEntity({
    required this.offset,
    required this.perPage,
  });
}
