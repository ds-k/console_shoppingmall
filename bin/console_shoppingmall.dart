import 'package:console_shoppingmall/class.dart';
import 'dart:io';

void main(List<String> arguments) {
  ShoppingMall shoppingMall = ShoppingMall([
    Product("셔츠", 45000),
    Product("원피스", 30000),
    Product("반팔티", 35000),
    Product("반바지", 38000),
    Product("양말", 50000),
  ]);

  void onBoarding() {
    print('''
---------------------------------------------------------------------------------------------------------
[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료
---------------------------------------------------------------------------------------------------------
''');
    switch (stdin.readLineSync()) {
      case "1":
        shoppingMall.showProducts();
        onBoarding();
      case "2":
        print("2입니다.");
        onBoarding();
      case "3":
        print("3입니다.");
        onBoarding();
      case "4":
        print("이용해 주셔서 감사합니다 ~ 안녕히 가세요 !");
      default:
        print("지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..");
    }
  }

  onBoarding();
}
