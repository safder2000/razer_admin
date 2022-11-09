import 'package:flutter/material.dart';

Row textfield(
    {int lines = 1,
    String hint = '',
    TextInputType keybord = TextInputType.text,
    required TextEditingController controller,
    double fieldWidth = 380}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: fieldWidth,
        child: TextFormField(
          controller: controller,
          keyboardType: keybord,
          minLines: lines,
          maxLines: 10,
          textAlign: TextAlign.start,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
              // errorText: _validate ? 'wrong password' : null,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 1.0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white60, width: 1.0),
              ),
              label: Text(
                hint,
                style: const TextStyle(color: Colors.white70),
              ),
              hintStyle: const TextStyle(color: Colors.white70)),
        ),
      ),
    ],
  );
}
