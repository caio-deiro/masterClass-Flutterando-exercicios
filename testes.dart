void main() {
  var diameter = <num, String>{1.0: 'Earth'};
  var otherDiameter = <num, String>{0.383: 'Mercury', 0.949: 'Venus'};
  print(otherDiameter.entries);
  for (final item in otherDiameter.entries) {
    diameter.putIfAbsent(item.key, () => item.value);
  }

  print(diameter);
}
