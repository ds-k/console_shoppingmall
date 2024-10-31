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

  // 카트에 product가 있는지 확인 후, 있으면 개수 추가 없으면 카트에 추가
  void addToCart(Product product, int quantity) {
    if (cartList.containsKey(product)) {
      /*
      cartList[product]의 타입이 int?라고 뜨지만,  
      전체 로직에서 cartList에 product를 주입할 때 
      무조건 int타입의 quantity를 주입하도록 설계
      그래서 cartList[product]! 해도 상관은 없으나,
      좀 더 안전하게 cartList[product] ?? 0 표현식 사용 권장
      */
      cartList[product] = (cartList[product] ?? 0) + quantity;
      // cartList[product] = cartList[product]! + quantity;
    } else {
      cartList[product] = quantity;
    }
  }

  // 장바구니에 담긴 갯수 출력
  void showTotal() {
    // totalPrice 초기화
    totalPrice = 0;
    cartList.forEach((product, quentity) {
      totalPrice += product.price * quentity;
      print("${product.name}를 $quentity개 담으셨습니다.");
    });
    print("장바구니에 $totalPrice원 어치를 담으셨네요 !");
  }

  // 장바구니 초기화
  void clearCartList() {
    if (cartList.isEmpty) {
      print("이미 장바구니가 비어있습니다.");
    } else {
      print("장바구니를 초기화합니다.");
      cartList = {};
    }
  }
}
