## console shoppingmall

![console shoppingmall](https://github.com/user-attachments/assets/e070092c-0502-47c3-a2c4-17f94b26e21a)

## 구현한 기능
### 필수 기능
> 1. 상품 목록(o)
> 2. 장바구니 담기(o)
> 3. 장바구니 총 금액 나타내기(o)
> 4. 프로그램 종료(o)

### 도전 기능
> 1. 프로그램 종료 시 묻기(o)
> 2. 장바구니 초기화(o)
> 3. 장바구니 상품의 목록과 가격 나타내기(o)
> 4. 자유 구현 - 상품의 개수까지 출력될수 있도록 함 

<br/>

## Class 설계

### Product 클래스
  - name : product의 이름
  - price : product의 가격

### ShoppingMall 클래스
	- productList: 쇼핑몰에서 제공하는 모든 상품
  - totalPrice : 장바구니에 들어간 모든 상품 가격의 합
  - cartList : Product를 key, 개수를 value로 하는 맵 형태
  - showProducts() : 상품을 출력하는 void 함수
  - addToCart(Product product, int quantity) : product와 개수를 받아 cartList에 추가하는 void 함수
  - showTotal() : cartList에 담긴 product의 개수와 금액을 출력하는 void 함수
  - clearCartList() : cartList를 초기화하는 void 함수


## TroubleShooting

#### map타입에서의 null safety 문제
- 문제 : addToCar에서 cartList[product]가 null일 수 있는 문제
- 해결 : cartList[product]의 타입이 int?라고 뜨지만, 전체 로직에서 cartList에 product를 주입할 때 무조건 int타입의 quantity를 주입하도록 설계되어 있다.
그래서 cartList[product]! 해도 상관은 없으나, 좀 더 안전하게 cartList[product] ?? 0 표현식 사용함으로 해결
- 고려 사항 : 좀 더 안전한 타입 설계가 가능하도록 dart의 타입에 대한 이해도를 높이기

