import '../morphism/morphism.dart';

/// A [Category] is a mathematical structure that consists of objects and morphisms between those objects, satisfying certain axioms.
class Category<O extends Object, M extends Morphism> {
  // TODO: Convert objects, morphisms, and identityMorphisms from List to Set data types to ensure uniqueness.
  // TODO: Validate morphisms to ensure the category contains id morphisms for each object - NOT generate them synthetically.
  // TODO: Write a method to retrieve id morphisms from the morphisms list - for one or many objects.

  final List<O> objects;
  final List<M> morphisms;
  final String? name;
  final String? description;

  Category({
    required this.objects,
    required this.morphisms,
    this.name,
    this.description,
  });

  Morphism identityMorphism(Object object) =>
      Morphism(Transformation(object, object));

  Morphism<A, C> compose<A, B, C>(Morphism<A, B> f, Morphism<B, C> g) {
    if (f.target == g.source) {
      return Morphism(Transformation(f.source, g.target));
    } else {
      throw ArgumentError(
          "Incompatible morphism composition: source ${g.source} and target ${f.target} do not match.");
    }
  }
}
