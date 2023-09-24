class MenuForm {
  List<String> imageMenu = [
    'assets/menu1.jpg',
    'assets/menu2.jpg',
    'assets/menu3.jpg',
    'assets/menu4.jpg',
    'assets/menu5.jpeg',
    'assets/menu6.jpg',
    'assets/menu7.jpg',
    'assets/menu8.jpg',
    'assets/menu9.jpg',
    'assets/menu10.jpg',
  ];

  List<double> priceMenu = [
    279,
    259,
    129,
    99,
    79,
    119,
    339,
    89,
    119,
    99,
  ];

  List<String> nameMenu = [
    'Steak',
    'Pizza',
    'Spaghetti',
    'Chicken Fried',
    'Nugget',
    'Burger',
    'Truffle Soup',
    'Garlic Bread',
    'BBQ Chiken',
    'Salad',
  ];
}

class Menu {
  String? name;
  double? price;
  int count = 0;

  Menu({required this.name, required this.price});

  void addOrder() {
    if (count < 99) {
      count++;
    }
  }

  void removeOrder() {
    if (count > 0) {
      count--;
    }
  }
}
