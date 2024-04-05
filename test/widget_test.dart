// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_temp/main.dart';

void main() async {
  print("Hello world");
  List<int> arr = [5,4,3,2,3,6,1];
 // print("Duplicate Item = ${findDuplicateNum(arr)}");
  print("Pair Sum = ${getPairSum(arr, 7)}");

}

List<int> findDuplicateNum(List<int> arr){
  List<int> arrTemp =[];
  for(int i = 0; i<= arr.length -1 ; i++){
    int toVisit = arr[i].abs() - 1;

    if(arr[toVisit] < 0 ){
      arrTemp.add(arr[toVisit].abs());
    }else {
      arr[toVisit] = arr[toVisit] * -1;
    }
  }
  return arrTemp;
}
List<int> getPairSum(List<int> arr, int num) {
  //[5,4,3,2,3,6,1] -> 7
  List<int> arrToReturn = [];
  Map<int,int> dict = {};
  for(int i = 0 ; i <= arr.length -1 ; i++) {
    int target = num - arr[i];
    if(dict[target] == null) {
      dict[arr[i]] = 0;
    }else {
      arrToReturn.add(target);
      arrToReturn.add(arr[i]);
    }

  }
  return arrToReturn;
}