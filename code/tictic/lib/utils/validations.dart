import 'package:email_validator/email_validator.dart';

final validCharacters = RegExp(r'^[a-zA-Z ]+$');

String? validateEmail(value) {
  if (value == null || value.isEmpty) {
    return 'Veuillez entrer une adresse mail';
  } else if (!EmailValidator.validate(value)) {
    return 'L’adresse mail n’est pas valide';
  }
  return null;
}

String? validateName(value, fieldName) {
  if (value == null || value.isEmpty) {
    return "Veuillez entrer votre $fieldName";
  } else if (!validCharacters.hasMatch(value)) {
    return "Votre $fieldName ne peut contenir que des lettres";
  }
  return null;
}

String? validatePassword(value) {
  if (value == null || value.isEmpty) {
    return 'Le mot de passe ne peut pas être vide';
  } else if (value.length < 10) {
    return 'Le mot de passe doit contenir au moins 9 caractères';
  }
  return null;
}
