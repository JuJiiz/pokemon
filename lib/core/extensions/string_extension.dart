extension StringExtension on String {
  int? tryParseInt() {
    return int.tryParse(this);
  }
}
