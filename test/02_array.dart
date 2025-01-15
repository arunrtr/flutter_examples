
void main() {

  List<int> arr = reverseArray([1,2,3,4]);
  print("The reverse of $arr");

}


List<int> reverseArray(List<int> arr){
  for(int i = 0 ; i< ((arr.length -1) * 0.5) ; i++) {
    print("inside");
    arr[i] = arr[i] + arr[arr.length - 1 - i];
    arr[arr.length -1 - i] = arr[i] - arr[arr.length - 1 - i];
    arr[i] = arr[i] -arr[arr.length - 1 - i];
    print(arr[i]);
  }
  return arr;
}