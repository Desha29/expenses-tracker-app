import '/../view/screens/shop/add_list.dart';
import '/../view/screens/shop/items_list.dart';
import 'package:flutter/material.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key});

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  void _addListBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => AddList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 43, 43),
        title: const Text(
          "Shopping list",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemsList(listName: "Product"),
                  ),
                );
              },
              leading: const ListIcons(),
              title: const Text(
                "Product",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              subtitle: const Text(
                "0/3 items",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addListBottomSheet,
        backgroundColor: const Color(0xffffd946),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(
          Icons.add,
          color: Color(0xff1e1e1e),
        ),
      ),
    );
  }
}

class ListIcons extends StatelessWidget {
  const ListIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Color(0xffffd946),
      radius: 25,
      child: Icon(
        Icons.shopping_bag_outlined,
        color: Color(0xff1e1e1e),
      ),
    );
  }
}
