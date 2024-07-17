class ValidateInputs {
  static String? validateIsEmpty(String value) {
    if (value.isEmpty) return "Este campo es requerido.";
    return null;
  }

  static String? validateIsLetter(String value) {
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return "Este campo solo permite letras.";
    }
    return null;
  }

  static String? validateIsNumber(String value) {
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "Este campo solo permite numeros.";
    }
    return null;
  }

  static String? validateisLengthMore(String value, int longited) {
    if (value.length < longited) return "Este campo es demasiado corto.";
    return null;
  }

  static String? validateisLengthMenor(String value, int longited) {
    if (value.length > longited) {
      return "Este campo su pera la cantidad de caracteres.";
    }
    return null;
  }

  static String? validateEmail(String value) {
    String? isEmpity = validateIsEmpty(value);
    if (isEmpity != null) {
      return isEmpity;
    }

    final emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!emailRegex.hasMatch(value)) {
      return 'El correo electrónico no es válido';
    }

    if (!value.endsWith('@gmail.com')) {
      return 'El correo electrónico debe ser de Gmail';
    }
    return null;
  }

  static String? validatePassword(String value) {
    String? isEmpity = validateIsEmpty(value);
    if (isEmpity != null) {
      return isEmpity;
    } else if (!RegExp(r'^.{8,}$').hasMatch(value)) {
      return 'La contraseña debe tener al menos 8 caracteres';
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'La contraseña debe incluir al menos una letra minúscula';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'La contraseña debe incluir al menos una letra mayúscula';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'La contraseña debe incluir al menos un número';
    } else if (!RegExp(r'[!@#\$%^&*(),.?-_"]').hasMatch(value)) {
      return 'La contraseña debe incluir al menos un caracter especial';
    }
    return null;
  }

  static String? validateConfirmation(String value, String valueConfirmation) {
    String? isEmpity = validateIsEmpty(value);
    if (isEmpity != null) {
      return isEmpity;
    }
    if (value != value) {
      return 'La contraseña no coincide';
    }
    return null;
  }
}
