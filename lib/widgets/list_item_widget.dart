import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({Key? key, required this.itemName}) : super(key: key);

  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50,
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Center(
        child: Text(itemName),
      ),
    );
  }
}
