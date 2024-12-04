

void main() {
  final weights = [400, 500, 700];
  final sizes = [10, 12, 14, 16, 18, 20];

  for (final weight in weights) {
    for (final size in sizes) {
      print('const TextStyle font$weight\$$size = TextStyle(fontFamily: \'Prompt\',fontWeight: FontWeight.w$weight,fontSize: $size);');
    }
    print('\n');
  }
}
