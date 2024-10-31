class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> productList;
  int totalPrice = 0;
  Map<Product, int> cartList = {}; // 갯수 파악하기 위해 Map 사용

  // 초기화할때 상품 리스트를 받아 초기화
  ShoppingMall(List<Product> products) : productList = products;

  void showProducts() {
    // productList.map((product) => print("${product.name} / ${product.price}원"));

    // 반복문으로 모든 product 출력
    for (int i = 0; i < productList.length; i++) {
      print("${productList[i].name} / ${productList[i].price}원");
    }
  }

  void addToCart(product, quantity) {
    cartList.update(product, (quantity) => quantity += 1);
  }

  void showTotal() {
    cartList.forEach((product, quentity) {
      totalPrice += product.price * quentity;
      print("$product를 $quentity개 담으셨습니다.");
    });
    print("장바구니에 $totalPrice원 어치를 담으셨네요 !");
  }
}
