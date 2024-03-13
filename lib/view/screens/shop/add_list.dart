import '/../view/screens/shop/shopping_list.dart';
import 'package:flutter/material.dart';

class AddList extends StatefulWidget {
  AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  List<IconData> shoppingIconslist = [
    Icons.shopping_cart_checkout_outlined,
    Icons.shopping_cart_checkout_outlined,
    Icons.shopping_cart_checkout_outlined,
    Icons.shopping_cart_checkout_outlined,
    Icons.shopping_cart_checkout_outlined,
    Icons.shopping_cart_checkout_outlined,
    Icons.shopping_cart_checkout_outlined,
    Icons.shopping_cart_checkout_outlined,
    Icons.shopping_cart_checkout_outlined,
    Icons.shopping_cart_checkout_outlined,
  ];

  bool _isPaid = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create your new list",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 35),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "List Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            Text(
              "Choose Icon ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 35),
              child: SizedBox(
                height: 50,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListIcons();
                  },
                  itemCount: shoppingIconslist.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 9),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "From Budget",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Switch(
                  value: _isPaid,
                  onChanged: (value) {
                    setState(() {
                      _isPaid = !_isPaid;
                    });
                  },
                  activeColor: Color(0xffffd946),
                ),
              ],
            ),
            Center(
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    "Create",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1e1e1e),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xffffd946),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
