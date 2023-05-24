
void main() {
  print('Circle');
  print('------');
  print(drawCircle());

  print('\nRectangle');
  print('---------');
  print(drawRectangle());
}

String drawCircle() {
  return '''
      *****
   **       **
 *             *
 *             *
 *             *
   **       **
      *****
  ''';
}

String drawRectangle() {
  return '''
 ********
 *                *
 *                *
 *                *
 *                *
 ********
  ''';
}
