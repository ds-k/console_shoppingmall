import 'package:console_shoppingmall/class.dart';
import 'dart:io';

void main(List<String> arguments) {
  void onBoarding() {
    print(
        '''---------------------------------------------------------------------------------------------------------
[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료
---------------------------------------------------------------------------------------------------------
''');
    switch (stdin.readLineSync()) {
      case "1":
        print("1입니다.");
        onBoarding();
      case "2":
        print("2입니다.");
        onBoarding();
      case "3":
        print("3입니다.");
        onBoarding();
      case "4":
        print("4입니다.");
        onBoarding();
      default:
        print("지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..");
    }
  }

  onBoarding();
}
