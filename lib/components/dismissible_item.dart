import 'package:flutter/material.dart';
import 'strike_through_text.dart';

class DismissibleItem extends StatefulWidget {
  final String text;
  bool isChecked;
  final Future<bool?> Function(DismissDirection)? onDismiss;

  DismissibleItem({super.key, required this.text, required this.isChecked, required this.onDismiss});

  @override
  State<DismissibleItem> createState() => _DismissibleItemState();
}

class _DismissibleItemState extends State<DismissibleItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) async {
        return false;
      },
      background: Container(
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white,),
      ),
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: widget.isChecked,
        onChanged: (value) {
          setState(() {
            widget.isChecked = !widget.isChecked;
          });
        },
        title: StrikeThroughText(
          text: widget.text,
          isLineThrough: widget.isChecked,
        ),
      ),
    );
  }
}
