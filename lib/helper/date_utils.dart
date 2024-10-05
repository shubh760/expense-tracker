import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<String?> showCustomDatePicker(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (picked != null) {
    // Format the date as "dd MMM yyyy"
    return DateFormat('dd MMM yyyy').format(picked);
  }

  return null;
}
