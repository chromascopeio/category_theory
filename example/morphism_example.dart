// ignore_for_file: unrelated_type_equality_checks

import 'package:category_theory/category_theory.dart';

void main() {
  // Create morphisms
  Morphism<int, String> f = Morphism(
    Transformation(42, "forty-two"),
  );

  Morphism<String, String> g = Morphism(
    Transformation('forty-two', "FORTY-TWO"),
  );

  // Print morphisms
  print('Morphisms: ${[f, g]}');

  // Check equality between morphisms
  Morphism<int, String> f2 = Morphism(Transformation(42, "forty-two"));
  print('f = f2 is ${f == f2}'); // Output: true
  print('f = g is ${f == g}'); // Output: false
}
