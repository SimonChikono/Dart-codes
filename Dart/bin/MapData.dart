void main() {
  // Create a Map with data
  var myMap = {
    'numbers': [1, 2, 3, 4, 5],
    'colors': {'red', 'green', 'blue'}
  };

  // Access data in the Map
  var numbers = myMap['numbers'];
  print('The numbers in the List are $numbers');

  var colors = myMap['colors'];
  print('The colors in the Set are $colors');
}
