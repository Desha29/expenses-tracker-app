import 'package:flutter/material.dart';

class ItemsList extends StatefulWidget {
  final String listName;
  ItemsList({Key? key, required this.listName}) : super(key: key);

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  List<bool> _isChecked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  String dropdownValue = "one";
  List<DropdownMenuItem<dynamic>>? items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Edit shopping list"),
              ),
              PopupMenuItem(
                child: Text("Share List"),
              ),
              PopupMenuItem(
                child: Text("Delete list"),
              )
            ],
          )
        ],
      ),
      body: ListView.builder(
          itemCount: _isChecked.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Checkbox(
                value: _isChecked[index],
                onChanged: (value) {
                  setState(() {
                    _isChecked[index] = !_isChecked[index];
                  });
                },
                activeColor: Color(0xffffd946),
              ),
              title: Text(
                "food",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    decoration:
                        _isChecked[index] ? TextDecoration.lineThrough : null),
              ),
              trailing: Text(
                "360\$",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    actions: [],
                    title: Text("New Item"),
                    content: Column(
                      children: [
                        Text("Item name"),
                        TextField(
                          decoration: InputDecoration(),
                        )
                      ],
                    ),
                  ));
        },
        backgroundColor: Color(0xffffd946),
        child: Icon(
          Icons.add,
          color: Color(0xff1e1e1e),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
