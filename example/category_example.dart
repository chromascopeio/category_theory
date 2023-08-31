import 'package:category_theory/category_theory.dart';

void main() {
  // Define a category.
  final category = Category<int, Morphism<int, int>>(
    name: 'Z/7Z-ish',
    description: 'Cyclic poset of integers 1..7.',
    objects: [1, 2, 3, 4, 5, 6, 7],
    morphisms: [
      Morphism<int, int>(Transformation(1, 2)),
      Morphism<int, int>(Transformation(2, 3)),
      Morphism<int, int>(Transformation(3, 4)),
      Morphism<int, int>(Transformation(4, 5)),
      Morphism<int, int>(Transformation(5, 6)),
      Morphism<int, int>(Transformation(6, 7)),
      Morphism<int, int>(Transformation(7, 1)),
      Morphism<int, int>(Transformation(1, 7)),
      Morphism<int, int>(Transformation(7, 6)),
      Morphism<int, int>(Transformation(6, 5)),
      Morphism<int, int>(Transformation(5, 4)),
      Morphism<int, int>(Transformation(4, 3)),
      Morphism<int, int>(Transformation(3, 2)),
      Morphism<int, int>(Transformation(2, 1)),
    ],
  );

  // Get the name of the category
  print('Name: ${category.name}');

  // Get the description of the category
  print('Description: ${category.description}');

  // Get objects in the category
  print('Objects: ${category.objects}');

  // Get morphisms in the category
  print('Morphisms: ${category.morphisms}');

  // Get morphisms from an object in the category
  var morphismsFromOne = category.morphismsFrom(1);
  print('Morphisms from 1: $morphismsFromOne');

  // Composition of morphisms
  Morphism f = category.morphisms[0]; // 1 → 2
  Morphism g = category.morphisms[1]; // 2 → 3
  Morphism h = category.morphisms[2]; // 3 → 4

  var gComposeF = category.compose(f, g); // 1 → 3
  var hComposeG = category.compose(g, h); // 2 → 4

  // Axiom 1: Associativity of Composition
  var hComposeGf = category.compose(gComposeF, h); // 1 → 4
  var hgComposeF = category.compose(f, hComposeG); // 1 → 4
  print(
    'For any composable triple of morphisms f, g, h, we have h ◦ (g ◦ f) = (h ◦ g) ◦ f. ${hComposeGf == hgComposeF}',
  );

  // Axiom 2: Identity
  var idA = category.identityMorphism(1);
  var idB = category.identityMorphism(2);
  print(
    'For any morphism f : A → B, f ◦ idA = f and idB ◦ f = f. ${category.compose(idA, f) == f && category.compose(f, idB) == f}',
  );

  // Two morphisms are compatible for composition iff the target of the first is the source of the second.
  try {
    category.compose(f, h); // ERROR
  } catch (error) {
    print(error);
  }
}

// This example is a good preliminary illustration, but has some limitations -
// such as the fact that it does not construct a generalized category but
// rather one that specifically contains integers 1..7. Additionally, it does not
// verify that any object-specific axioms are adhered to.
// Therefore, I propose an example should be written that illustrates the construction of the Poset category.
// Morphism validation could be done via overridden Category methods, and type generics
// could be used to construct Posets of any comparable datatype.
// It must be stressed that there is a difference between defining a Poset as a Category vs. as a FiniteAlgebra (see: abstract_algebra).
// I think it would be useful to design Category in such a way that it can enrich any FiniteAlgebra.
// TODO: Write an example that incorporates the learnings described in the above lines to create a generic Poset category.
