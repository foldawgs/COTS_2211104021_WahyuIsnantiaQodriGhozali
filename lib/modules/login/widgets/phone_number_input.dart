import 'package:flutter/material.dart';

class PhoneNumberInput extends StatelessWidget {
  final Function(String) onChanged;

  const PhoneNumberInput({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        keyboardType: TextInputType.phone,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixText: '+62 ',
          hintText: 'Nomor HP',
          hintStyle: TextStyle(color: Color(0xFF727272)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        ),
      ),
    );
  }
}
