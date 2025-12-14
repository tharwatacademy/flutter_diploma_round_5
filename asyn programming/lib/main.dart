void main() async {
  Future.wait([createOrderMessage(), fetchUserOrder()]);
}

Future<String> createOrderMessage() async {
  String order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() {
  return Future.delayed(const Duration(seconds: 1), () => 'Large Latte');
}
