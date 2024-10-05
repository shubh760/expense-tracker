import 'package:expense_tracker/consts/color_const.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T? value;
  final Function(T?) onChanged;
  final String hint;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.hint,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    // Ensure the current value is in the items list
    final effectiveValue =
        widget.items.contains(widget.value) ? widget.value : null;

    return Container(
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colors.tileColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButton<T>(
        isExpanded: true,
        value: effectiveValue,
        onChanged: widget.onChanged,
        items: widget.items.map<DropdownMenuItem<T>>((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(item.toString()),
          );
        }).toList(),
        style: CustomTextStyle.textStyle(),
        hint: Text(
          widget.hint,
          style: CustomTextStyle.textStyle(),
        ),
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        iconEnabledColor: Colors.yellow,
        underline: Container(
          height: 1,
        ),
      ),
    );
  }
}

class CustomTextStyle {
  static TextStyle textStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 16,
    );
  }
}
