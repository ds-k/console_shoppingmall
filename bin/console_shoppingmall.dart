import 'package:console_shoppingmall/class.dart';
import 'dart:io';

void main(List<String> arguments) {
  ShoppingMall shoppingMall = ShoppingMall([
    Product("셔츠", 45000),
    Product("원피스", 30000),
    Product("반팔티", 35000),
    Product("반바지", 38000),
    Product("양말", 5000),
  ]);

  void onBoarding() {
    print('''
---------------------------------------------------------------------------------------------------------
[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료
[6] 장바구니 초기화 /
---------------------------------------------------------------------------------------------------------
''');
    switch (stdin.readLineSync()) {
      case "1":
        shoppingMall.showProducts();
        onBoarding();
      case "2":
        try {
          print("상품 이름을 입력해 주세요 !");
          String name = stdin.readLineSync() as String;
          print("상품 개수을 입력해 주세요 !");
          int quantity = int.parse(stdin.readLineSync() as String);
          List<String> productNameList =
              shoppingMall.productList.map((e) => e.name).toList();
          if (!productNameList.contains(name)) {
            throw Exception("입력값이 올바르지 않아요 !");
          } else if (quantity <= 0) {
            throw Exception("0개보다 많은 개수의 상품만 담을 수 있어요 !");
          }
          Product productToAddCart = shoppingMall.productList
              .where((product) => product.name == name)
              .toList()[0];
          shoppingMall.addToCart(productToAddCart, quantity);
        } on FormatException {
          print("입력값이 올바르지 않아요 !");
        } catch (e) {
          print(e.toString().substring(11)); // Exception 자르기
        }

        onBoarding();
      case "3":
        shoppingMall.showTotal();
        onBoarding();
      case "4":
        print("정말 종료하시겠습니까?");
        if (stdin.readLineSync() == "5") {
          print("이용해 주셔서 감사합니다 ~ 안녕히 가세요 !");
        } else {
          print("종료하지 않습니다.");
          onBoarding();
        }
      case "6":
        shoppingMall.clearCartList();
        onBoarding();
      default:
        print("지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..");
    }
  }

  onBoarding();
}
