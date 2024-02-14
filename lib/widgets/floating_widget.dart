import 'package:flutter/material.dart';
import 'package:quickly/quickly.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
      backgroundColor: FxColor.blue400,
      shape: RoundedRectangleBorder(borderRadius: FxRadius.all(15)),
    );
  }
}
