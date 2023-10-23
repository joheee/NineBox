import 'package:flutter/material.dart';
import 'package:mati_murup/config/variable.dart';

class CustomDropdown extends StatefulWidget {
  
  final List<String> list;
  final Function(String? t) onSelected;

  const CustomDropdown({
    super.key,
    required this.list,
    required this.onSelected
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
  
    return DropdownMenu<String>(
      initialSelection: widget.list.first,
      inputDecorationTheme: InputDecorationTheme(
         focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Variable.secondaryColor
          ), 
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Variable.secondaryColor
          ), 
        ),
      ),
      onSelected: widget.onSelected,
      dropdownMenuEntries: widget.list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}