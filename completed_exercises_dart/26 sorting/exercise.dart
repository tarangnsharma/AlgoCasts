// --- Directions
// Implement bubbleSort, selectionSort, and mergeSort

List<int> bubbleSort(List<int> arr) {
  List<int> sorted = [];
  for (int val in arr) {
    sorted.add(val);
  }
  for (int ix = 0; ix < arr.length; ix++) {
    for (int ix2 = ix + 1; ix2 < arr.length; ix2++) {
      if (sorted[ix2] < sorted[ix]) {
        int tmp = sorted[ix];
        sorted[ix] = sorted[ix2];
        sorted[ix2] = tmp;
      }
    }
  }
  return sorted;
}

List<int> selectionSort(List<int> arr) {
  int indexOfLowest;
  for (int outerIndex = 0; outerIndex < arr.length; outerIndex++) {
    indexOfLowest = outerIndex;
    for (int innerIndex = outerIndex + 1;
        innerIndex < arr.length;
        innerIndex++) {
      if (arr[innerIndex] < arr[indexOfLowest]) {
        indexOfLowest = innerIndex;
      }
    }
    if (indexOfLowest != outerIndex) {
      final lowerValue = arr[outerIndex];
      arr[outerIndex] = arr[indexOfLowest];
      arr[indexOfLowest] = lowerValue;
    }
  }
  return arr;
}

List<int> mergeSort(List<int> arr) {
  if (arr.length == 1) {
    return arr;
  }
  int halfSize = arr.length ~/ 2;
  List<int> firstHalf = arr.sublist(0, halfSize);
  List<int> secondHalf = arr.sublist(halfSize);
  return merge(mergeSort(firstHalf), mergeSort(secondHalf));
}

List<int> merge(List<int> left, List<int> right) {
  List<int> mergedList = [];
  while (left.isNotEmpty && right.isNotEmpty) {
    if (left.first < right.first) {
      mergedList.add(left.removeAt(0));
    } else {
      mergedList.add(right.removeAt(0));
    }
  }
  return [...mergedList, ...left, ...right];
}
