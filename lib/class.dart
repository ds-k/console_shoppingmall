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
    for (Product product in productList) {
      print("${product.name} / ${product.price}원");
    }
  }

  void addToCart(Product product, int quantity) {
    if (cartList.containsKey(product)) {
      cartList[product] = cartList[product]! + quantity;
    } else {
      cartList[product] = quantity;
    }
  }

  void showTotal() {
    cartList.forEach((product, quentity) {
      totalPrice += product.price * quentity;
      print("${product.name}를 $quentity개 담으셨습니다.");
    });
    print("장바구니에 $totalPrice원 어치를 담으셨네요 !");
  }
}
