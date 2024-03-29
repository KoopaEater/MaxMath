
import 'numbers.dart';

void main(List<String> arguments) {

  // Integers
  Number four = Integer(4);
  Number five = Integer(5);
  Number six = Integer(6);
  Number seven = Integer(7);

  // Fractions
  Number fourOverFive = Fraction(four, five);
  Number sixOverSeven = Fraction(six, seven);

  // Real Numbers
  Number zeroPointFive = RealNumber(0.5);
  Number pi = RealNumber(3.1415926);
  Number onePointTwoTwoTwo = RealNumber(1.222);
  Number threePointSevenSevenEight = RealNumber(3.778);

  print("\nINTEGER");

  Number intAddInt = four.add(five);
  Number intAddFrac = six.add(fourOverFive);
  Number intAddReal = five.add(pi);
  Number intMultInt = four.mult(five);
  Number intMultFrac = four.mult(sixOverSeven);
  Number intMultReal = five.mult(pi);
  Number intDivInt = seven.divide(five);
  Number intDivFrac = six.divide(fourOverFive);
  Number intDivReal = five.divide(zeroPointFive);

  print("4 + 5 = $intAddInt");
  print("4 * 5 = $intMultInt");
  print("5 + pi = $intAddReal");
  print("6 + (4/5) = $intAddFrac");
  print("4 * (6/7) = $intMultFrac");
  print("5 * pi = $intMultReal");
  print("7 / 5 = $intDivInt");
  print("6 / (4/5) = $intDivFrac");
  print("5 / 0.5 = $intDivReal");

  print("\nFRACTION");

  Number fracAddFrac = fourOverFive.add(sixOverSeven);
  Number fracAddInt = fourOverFive.add(six);
  Number fracAddReal = sixOverSeven.add(zeroPointFive);
  Number fracMultInt = sixOverSeven.mult(four);
  Number fracMultFrac = fourOverFive.mult(sixOverSeven);
  Number fracMultReal = sixOverSeven.mult(pi);
  Number fracDivInt = fourOverFive.divide(seven);
  Number fracDivFrac = fourOverFive.divide(sixOverSeven);
  Number fracDivReal = sixOverSeven.divide(onePointTwoTwoTwo);

  print("(4/5) + (6/7) = $fracAddFrac");
  print("(4/5) + 6 = $fracAddInt");
  print("(6/7) + 0.5 = $fracAddReal");
  print("(6/7) * 4 = $fracMultInt");
  print("(4/5) * (6/7) = $fracMultFrac");
  print("(6/7) * pi = $fracMultReal");
  print("(4/5) / 7 = $fracDivInt");
  print("(4/5) / (6/7) = $fracDivFrac");
  print("(6/7) / 1.222 = $fracDivReal");

  print("\nREAL NUMBER");

  Number realAddInt = zeroPointFive.add(seven);
  Number realAddFrac = pi.add(fourOverFive);
  Number realAddReal = onePointTwoTwoTwo.add(threePointSevenSevenEight);
  Number realMultInt = zeroPointFive.mult(six);
  Number realMultFrac = zeroPointFive.mult(fourOverFive);
  Number realMultReal = pi.mult(zeroPointFive);
  Number realDivInt = zeroPointFive.divide(six);
  Number realDivFrac = pi.divide(sixOverSeven);
  Number realDivReal = onePointTwoTwoTwo.divide(zeroPointFive);

  print("0.5 + 7 = $realAddInt");
  print("pi + (4/5) = $realAddFrac");
  print("1.222 + 3.778 = $realAddReal");
  print("0.5 * 6 = $realMultInt");
  print("0.5 * (4/5) = $realMultFrac");
  print("pi * 0.5 = $realMultReal");
  print("0.5 / 6 = $realDivInt");
  print("pi / (6/8) = $realDivFrac");
  print("1.222 / 0.5 = $realDivReal");

}