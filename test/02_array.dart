void main() {
  // print("The reverse of ${reverseArray([1, 2, 3, 4])}");
  //print("The good pair is ${goodPair([1, 2, 3, 1, 1, 3])}");
  print("The Missing Number  is ${missingNumber([0, 1, 2, 3, 4, 6])}");
}

// missing number
int missingNumber(List<int> arr) {
  int currentSum = 0;
  for (var element in arr) {
    currentSum += element;
  }
  return (arr.length * (arr.length + 1)) ~/ 2 - currentSum;
}

// good pairs
//https://www.youtube.com/watch?v=S-NGf0yWXN8
int goodPair(List<int> arr) {
  int numOfPair = 0;
  Map<int, int> dict = {};
  for (int i = 0; i < arr.length; i++) {
    if (dict.containsKey(arr[i])) {
      dict[arr[i]] = dict[arr[i]]! + 1;
    } else {
      dict[arr[i]] = 1;
    }
  }

  print("My Good Pair dict = $dict");

  dict.forEach((key, value) {
    numOfPair += (value * (value - 1)) ~/ 2; // this is the main thing here, n*(n-1)/2
  });

  return numOfPair;
}

//   reverse array
List<int> reverseArray(List<int> arr) {
  for (int i = 0; i < ((arr.length - 1) * 0.5); i++) {
    arr[i] = arr[i] + arr[arr.length - 1 - i];
    arr[arr.length - 1 - i] = arr[i] - arr[arr.length - 1 - i];
    arr[i] = arr[i] - arr[arr.length - 1 - i];
  }
  return arr;
}
