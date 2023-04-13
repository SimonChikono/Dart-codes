void main() {
  int rows = 3; // replace with desired number of rows
  int cols = 4; // replace with desired number of columns

  List<List<int>> matrix = createMatrix(rows, cols);
  printMatrix(matrix);
}

List<List<int>> createMatrix(int rows, int cols) {
  List<List<int>> matrix = List.generate(rows, (i) => List.filled(cols, 0));
  int counter = 1;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      matrix[i][j] = counter++;
    }
  }
  return matrix;
}

void printMatrix(List<List<int>> matrix) {
  for (List<int> row in matrix) {
    print(row);
  }
}
