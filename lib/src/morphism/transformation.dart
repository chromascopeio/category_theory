part of 'morphism.dart';

class Transformation<A, B> {
  final A source;
  final B target;

  Transformation(this.source, this.target);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transformation &&
          source == other.source &&
          target == other.target;

  @override
  int get hashCode => source.hashCode ^ target.hashCode;

  @override
  String toString() => 'Mapping { $source, $target }';
}
