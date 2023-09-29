import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isHidden,
      obscuringCharacter: "#",
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.green, width: 5)),
        hintText: "Password",
        suffix: IconButton(
          onPressed: _changeVisibilty,
          icon: AnimatedCrossFade(
              firstChild: Icon(Icons.visibility_outlined),
              secondChild: Icon(Icons.visibility_off_outlined),
              crossFadeState:
                  _isHidden ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: Duration(milliseconds: 300)),
        ),
      ),
    );
  }

  void _changeVisibilty() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
