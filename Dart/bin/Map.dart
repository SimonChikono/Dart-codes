void main() {
  // Create a Map with data
  var person = {
    'name': 'John',
    'age': 25,
    'height': 1.75
  };

  // Use containsValue to find data
  if (person.containsValue('John')) {
    print('The person\'s name is John');
  }

  if (person.containsValue(25)) {
    print('The person is 25 years old');
  }

  if (person.containsValue(1.75)) {
    print('The person is 1.75 meters tall');
  }
}
