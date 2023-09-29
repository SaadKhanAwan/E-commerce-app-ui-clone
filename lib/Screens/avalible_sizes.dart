import 'package:flutter/material.dart';

class AvalableSizes extends StatefulWidget {
  final String size;
  const AvalableSizes({super.key, required this.size});

  @override
  State<AvalableSizes> createState() => _AvalableSizesState();
}

class _AvalableSizesState extends State<AvalableSizes> {
  // this is for select size of shoes and jackets
  bool isSeleted = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSeleted = !isSeleted;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: 40,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSeleted ? Colors.red : Colors.grey,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: isSeleted ? Colors.red : Colors.grey,
            )),
        child: Text(
          widget.size,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
