void main() {
  // Create a Set with data
  var numbers = <num>{1, 2.5, 3, 4.2, 5};
  var names = <String>{'John', 'Mary', 'Tom', 'Kate'};

  // Use lookup to find data
  var number = numbers.lookup(4.2);
  if (number != null) {
    print('The number 4.2 is in the Set');
  }

  var name = names.lookup('Tom');
  if (name != null) {
    print('The name Tom is in the Set');
  }
}
