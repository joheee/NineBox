import 'dart:math';

class CustomGame {
  static List<int> generateRandomNumber(int limit) {
    List<int> list = [];
    for(int i=0;i<limit;i++) {
      Random random = Random();
      list.add(random.nextInt(9));
    }
    return list;
  }
}