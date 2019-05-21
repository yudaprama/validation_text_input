library validation_text_input;

import 'dart:async';

import 'package:flutter/material.dart';

String validatePhoneNumber(String value) {
  if (value.isEmpty)
    return 'Nomor telepon tidak boleh kosong';

  final phoneWithoutDash = value.replaceAll('-', '');
  final phoneSplit = phoneWithoutDash.split("");
  if ((phoneWithoutDash.length < 10) || phoneSplit[0] != "0" || phoneSplit[1] != "8")
    return 'Nomor telepon tidak valid';
  return null;
}

String validateName(String value) {
  if (value.isEmpty) return 'Nama tidak boleh kosong';
  return null;
}

String validateEmpty(String value) {
  if (value.isEmpty) return 'Tidak boleh kosong';
  return null;
}

String validateNotEmpty(String value, String subject) {
  if (value.isEmpty) return '$subject tidak boleh kosong';
  return null;
}

String validateEmail(String value) {
  if (value.isEmpty)
    return 'Email tidak boleh kosong.';
  final RegExp nameExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!nameExp.hasMatch(value))
    return 'Email tidak valid.';
  return null;
}

Future<bool> warnUserAboutInvalidData(context, formWasEdited, formKey) async {
  final FormState form = formKey.currentState;
  if (form == null || !formWasEdited || form.validate()) return true;

  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('This form has errors'),
      content: const Text('Really leave this form?'),
      actions: <Widget>[
        FlatButton(
          child: const Text('YES'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: const Text('NO'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    ),
  ) ?? false;
}

