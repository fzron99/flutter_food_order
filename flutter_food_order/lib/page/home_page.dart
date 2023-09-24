import 'package:flutter/material.dart';
import 'package:flutter_food_order/model/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Menu>? showMenu;

  @override
  void initState() {
    super.initState();
    showMenu = createMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.menu),
            const Text('Menu'),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.library_books),
                    label: const Text('My order'),
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 238, 110, 101))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: cardMenu(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        tooltip: '',
        icon: const Icon(Icons.shopping_basket),
        label: Text(
          countOrder().toString(),
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.green[700],
      ),
    );
  }

  int countOrder() {
    int order = 0;
    for (var i = 0; i < showMenu!.length; i++) {
      order += showMenu![i].count;
    }

    return order;
  }

  List<Menu>? createMenu() {
    List<Menu> allMenu = [];
    for (var i = 0; i < MenuForm().nameMenu.length; i++) {
      allMenu.add(Menu(name: MenuForm().nameMenu[i], price: MenuForm().priceMenu[i]));
    }

    return allMenu;
  }

  List<Widget> cardMenu() {
    List<Widget> card = [];
    for (var i = 0; i < MenuForm().nameMenu.length; i++) {
      card.add(
        Card(
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Image.asset(
                  MenuForm().imageMenu[i],
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      showMenu![i].name!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            showMenu![i].price.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          const Text(
                            '฿',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        iconSize: 20,
                        color: Colors.black,
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.center,
                        onPressed: () {
                          showMenu![i].addOrder();
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      showMenu![i].count.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.remove),
                        iconSize: 20,
                        color: Colors.black,
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.center,
                        onPressed: () {
                          showMenu![i].removeOrder();
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return card;
  }
}
