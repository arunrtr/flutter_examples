import 'dart:collection';
import 'dart:ffi';

main() {
  List<int> indexes = sumIndices([2, 3, 4, 5, 7, 13], 9);
  print("Indexes of Two Sum is $indexes");
}

List<int> sumIndices(List<int> arr, int target) {
  List<int> indices = [];
  Map<int, int> dict = {};
  for (int i = 0; i <= arr.length - 1; i++) {
    int num = target - arr[i];
    if (dict.containsKey(num)) {
      indices.add(dict[num]!);
      indices.add(i);
    } else {
      dict[arr[i]] = i;
    }
  }

  return indices;
}
