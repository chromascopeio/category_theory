part 'transformation.dart';

/// A [Morphism] is used to hold mappings between source and target objects.
/// Equality and hash code behavior is consistent with the underlying [Transformation] implementation.
class Morphism<A, B> {
  final String? name;
  final String? description;
  final Transformation<A, B> arrow;

  Morphism(
    this.arrow, {
    this.name,
    this.description,
  });

  A get source => arrow.source;
  B get target => arrow.target;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Morphism && arrow == other.arrow);

  @override
  int get hashCode => arrow.hashCode;

  @override
  String toString() => '${arrow.source} → ${arrow.target}';
}
