

import 'dart:ffi';

abstract class Number {

  Number add(Number other);
  Number mult(Number other);
  Number divide(Number other);
  double n();

}

class Nil extends Number {

  static final Nil _nil = Nil._internal();

  factory Nil() {
    return _nil;
  }

  Nil._internal();

  @override
  Number add(Number other) => Nil();

  @override
  Number mult(Number other) => Nil();

  @override
  Number divide(Number other) => Nil();

  @override
  double n() => 0;

  @override
  String toString() => "NIL";

}

class Integer extends Number {

  final int value;

  Integer(this.value);

  @override
  Number add(Number other) {
    switch (other.runtimeType) {
      case Integer:
        (other as Integer);
        return Integer(this.value + other.value);
      case Fraction:
        (other as Fraction);
        return other.add(this);
      case RealNumber:
        (other as RealNumber);
        return other.add(this);
      default:
        return Nil();
    }
  }

  @override
  Number mult(Number other) {
    switch (other.runtimeType) {
      case Integer:
        (other as Integer);
        return Integer(this.value * other.value);
      case Fraction:
        (other as Fraction);
        return other.mult(this);
      case RealNumber:
        (other as RealNumber);
        return other.mult(this);
      default:
        return Nil();
    }
  }

  @override
  Number divide(Number other) {
    switch (other.runtimeType) {
      case Integer:
        (other as Integer);
        double newValue = (this.value.roundToDouble()) / (other.value.roundToDouble());
        return (newValue % 1 == 0) ? Integer(newValue.round()) : RealNumber(newValue);
      case Fraction:
        (other as Fraction);
        return Fraction(this, Integer(1)).divide(other);
      case RealNumber:
        (other as RealNumber);
        return RealNumber(this.value.roundToDouble()).divide(other);
      default:
        return Nil();
    }
  }

  @override
  double n() => value.roundToDouble();

  @override
  String toString() => value.toString();

}

class Fraction extends Number {

  final Number numerator;
  final Number denominator;

  Fraction(this.numerator, this.denominator);

  @override
  Number add(Number other) {
    switch (other.runtimeType) {
      case Integer:
        (other as Integer);
        return Fraction(this.numerator.add(other.mult(this.denominator)), this.denominator);
      case Fraction:
        (other as Fraction);
        return Fraction(this.numerator.mult(other.denominator).add(other.numerator.mult(this.denominator)), this.denominator.mult(other.denominator));
      case RealNumber:
        (other as RealNumber);
        return Fraction(this.numerator.add(other.mult(this.denominator)), this.denominator);
      default:
        return Nil();
    }
  }

  @override
  Number mult(Number other) {
    switch (other.runtimeType) {
      case Integer:
        (other as Integer);
        return Fraction(this.numerator.mult(other), this.denominator);
      case Fraction:
        (other as Fraction);
        return Fraction(this.numerator.mult(other.numerator), this.denominator.mult(other.denominator));
      case RealNumber:
        (other as RealNumber);
        return Fraction(this.numerator.mult(other), this.denominator);
      default:
        return Nil();
    }
  }

  @override
  Number divide(Number other) {
    switch (other.runtimeType) {
      case Integer:
        (other as Integer);
        return Fraction(this.numerator, this.denominator.mult(other));
      case Fraction:
        (other as Fraction);
        return this.mult(other.inverse());
      case RealNumber:
        (other as RealNumber);
        return Fraction(this.numerator, this.denominator.mult(other));
      default:
        return Nil();
    }
  }

  Fraction inverse() => Fraction(denominator, numerator);

  @override
  double n() => numerator.divide(denominator).n();

  @override
  String toString() => "(${numerator.toString()}/${denominator.toString()})";

}

class RealNumber extends Number {

  final double value;

  RealNumber(this.value);

  @override
  Number add(Number other) {
    switch (other.runtimeType) {
      case Integer:
        (other as Integer);
        return RealNumber(this.value + other.value);
      case Fraction:
        (other as Fraction);
        return other.add(this);
      case RealNumber:
        (other as RealNumber);
        double newValue = this.value + other.value;
        return (newValue % 1 == 0) ? Integer(newValue.round()) : RealNumber(newValue);
      default:
        return Nil();
    }
  }

  @override
  Number mult(Number other) {
    switch (other.runtimeType) {
      case Integer:
        (other as Integer);
        double newValue = this.value * other.value;
        return (newValue % 1 == 0) ? Integer(newValue.round()) : RealNumber(newValue);
      case Fraction:
        (other as Fraction);
        return other.mult(this);
      case RealNumber:
        (other as RealNumber);
        double newValue = this.value * other.value;
        return (newValue % 1 == 0) ? Integer(newValue.round()) : RealNumber(newValue);
      default:
        return Nil();
    }
  }

  @override
  Number divide(Number other) {
    switch (other.runtimeType) {
      case Integer:
        (other as Integer);
        double newValue = this.value / (other.value.roundToDouble());
        return (newValue % 1 == 0) ? Integer(newValue.round()) : RealNumber(newValue);
      case Fraction:
        (other as Fraction);
        return Fraction(this, Integer(1)).divide(other);
      case RealNumber:
        (other as RealNumber);
        double newValue = this.value / other.value;
        return (newValue % 1 == 0) ? Integer(newValue.round()) : RealNumber(newValue);
      default:
        return Nil();
    }
  }

  @override
  double n() => value;

  @override
  String toString() => value.toString();

}