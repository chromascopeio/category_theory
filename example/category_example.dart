import 'package:category_theory/category_theory.dart';

void main() {
  // Define a category.
  final category = Category<String, Morphism<String, String>>(
    objects: ['A', 'B', 'C', 'D'],
    morphisms: [
      Morphism<String, String>(Transformation('A', 'B')),
      Morphism<String, String>(Transformation('B', 'C')),
      Morphism<String, String>(Transformation('C', 'D')),
      Morphism<String, String>(Transformation('D', 'C')),
      Morphism<String, String>(Transformation('C', 'B')),
      Morphism<String, String>(Transformation('B', 'A')),
    ],
  );

  // Get objects in the category
  print('Objects: ${category.objects}');

  // Get morphisms in the category
  print('Morphisms: ${category.morphisms}');

  // Composition of morphisms
  Morphism f = category.morphisms[0]; // 'A' → 'B'
  Morphism g = category.morphisms[1]; // 'B' → 'C'
  Morphism h = category.morphisms[2]; // 'C' → 'D'

  var gComposeF = category.compose(f, g); // 'A' → 'C'
  var hComposeG = category.compose(g, h); // 'B' → 'D'

  // Axiom 'A': Associativity of Composition
  var hComposeGf = category.compose(gComposeF, h); // 'A' → 'D'
  var hgComposeF = category.compose(f, hComposeG); // 'A' → 'D'
  print(
    'For any composable triple of morphisms f, g, h, we have h ◦ (g ◦ f) = (h ◦ g) ◦ f. ${hComposeGf == hgComposeF}',
  );

  // Axiom 'B': Identity
  var idA = category.identityMorphism('A');
  var idB = category.identityMorphism('B');
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
// rather one that specifically contains letters 'A'..'G'. Additionally, it does not
// verify that any object-specific axioms are adhered to.
// Therefore, I propose an example should be written that illustrates the construction of the Poset category.
// Morphism validation could be done via overridden Category methods, and type generics
// could be used to construct Posets of any comparable datatype.
// It must be stressed that there is a difference between defining a Poset as a Category vs. as a FiniteAlgebra (see: abstract_algebra).
// I think it would be useful to design Category in such a way that it can enrich any FiniteAlgebra.
// TODO: Write an example that incorporates the learnings described in the above lines to create a generic Poset category.
