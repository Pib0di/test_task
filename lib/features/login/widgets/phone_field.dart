import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_task/features/login/bloc/login_bloc.dart';
import 'package:test_task/theme.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({
    super.key,
    required this.enabled,
    required this.controller,
  });

  final bool enabled;
  final TextEditingController controller;

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
    widget.controller.text = '+7';
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Номер телефона'),
          const SizedBox(height: 4),
          TextFormField(
            enabled: widget.enabled,
            controller: widget.controller,
            keyboardType: TextInputType.phone,
            inputFormatters: [maskFormatter],
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.transparent,
              hintText: "+7",
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: LightColors.yellow),
              ),
            ),
            onChanged: (value) {
              if (maskFormatter.isFill()) {
                loginBloc.add(Update(true, 0));
              } else {
                loginBloc.add(Update(false, 0));
              }
            },
            validator: _requiredField,
          ),
        ],
      ),
    );
  }
}

String? _requiredField(String? value) =>
    value?.isEmpty ?? true ? 'Пустое поле' : null;
