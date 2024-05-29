import 'package:flutter/material.dart';
import 'package:kwaba/styles/text.dart';

class SimpleDropdown extends StatefulWidget {
  const SimpleDropdown({
    super.key,
    required this.items,
    this.value,
    this.hintText,
    this.onChanged,
    this.validator,
    this.title,
  });

  final String? title;
  final List<String> items;
  final String? value;
  final String? hintText;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<SimpleDropdown> createState() => _SimpleDropdownState();
}

class _SimpleDropdownState extends State<SimpleDropdown> {
  late final items = widget.items;
  late final title = widget.title;

  @override
  Widget build(BuildContext context) {
    final field = DropdownButtonFormField<String>(
      hint: Text(
        widget.hintText ?? '',
        style: AppText.bold400.copyWith(
          color: Colors.grey,
        ),
      ),
      value: widget.value,
      elevation: 0,
      icon: const Icon(Icons.arrow_drop_down),
      isExpanded: true,
      dropdownColor: Colors.white,
      onChanged: widget.onChanged,
      validator: widget.validator,
      borderRadius: BorderRadius.circular(8),
      alignment: Alignment.bottomCenter,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    if (title != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: AppText.bold600,
          ),
          const SizedBox(height: 8),
          field,
        ],
      );
    } else {
      return field;
    }
  }
}
