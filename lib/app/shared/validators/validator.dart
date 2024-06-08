import 'package:crud_auth/app/shared/util/currency_util.dart';
import 'package:email_validator/email_validator.dart';

class Validator {
  static String? emailFieldValidation(String? email) {
    if (email == null || email.isEmpty) {
      return 'Campo obrigatório';
    }
    if (!EmailValidator.validate(email.trim())) {
      return 'Email inválido';
    }
    return null;
  }

  static String? requiredPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    if (value.length < 6) {
      return 'Mínimo 6 caracteres';
    }
    return null;
  }

  static String? confirmPassValidation(String? pass, String? confirmPass) {
    if (pass == null || pass.isEmpty) {
      return 'Campo obrigatório';
    }
    if (pass.length < 6) {
      return 'Mínimo 6 caracteres';
    }
    if (pass != confirmPass) {
      return 'Senhas não coincidem';
    }
    return null;
  }

  static String? requiredName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    if (value.length < 3) {
      return 'Mínimo 3 caracteres';
    }
    return null;
  }

  static String? requiredValidPrice(String? value) {
    if (value!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      if (CurrencyUtil.parseCurrency(value) < 0.01) {
        return 'Valor muito baixo!';
      } else if (CurrencyUtil.parseCurrency(value) > 100000000000.0) {
        return 'Valor muito alto!';
      }
    }
    return null;
  }
}
