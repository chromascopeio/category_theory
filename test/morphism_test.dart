import 'package:category_theory/category_theory.dart';
import 'package:test/test.dart';

void main() {
  group('Transformation', () {
    test('Equality and Hash Code', () {
      final transformation1 = Transformation<int, String>(1, 'one');
      final transformation2 = Transformation<int, String>(1, 'one');
      final transformation3 = Transformation<int, String>(2, 'two');

      expect(transformation1, equals(transformation2));
      expect(transformation1.hashCode, equals(transformation2.hashCode));
      expect(transformation1, isNot(equals(transformation3)));
    });

    test('String Representation', () {
      final transformation = Transformation<String, int>('hello', 5);
      expect(transformation.toString(), equals('Mapping { hello, 5 }'));
    });
  });

  group('Morphism', () {
    test('Equality and Hash Code', () {
      final transformation = Transformation<double, int>(3.14, 3);
      final morphism1 = Morphism<double, int>(transformation);
      final morphism2 = Morphism<double, int>(transformation);
      final morphism3 = Morphism<int, double>(Transformation(1, 3.14));

      expect(morphism1, equals(morphism2));
      expect(morphism1.hashCode, equals(morphism2.hashCode));
      expect(morphism1, isNot(equals(morphism3)));
    });

    test('String Representation', () {
      final transformation = Transformation<int, String>(42, 'forty-two');
      final morphism = Morphism<int, String>(transformation);
      expect(morphism.toString(), equals('42 → forty-two'));
    });

    test('Source and Target Access', () {
      final transformation = Transformation<String, String>('start', 'finish');
      final morphism = Morphism<String, String>(transformation);

      expect(morphism.source, equals('start'));
      expect(morphism.target, equals('finish'));
    });
  });
}
