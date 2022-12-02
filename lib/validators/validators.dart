String? validatorVazio(String value) {
  if(value.isEmpty) {
    return 'Campo obrigatório';
  }

  return null;
}

bool validatorEmail(String value) {
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
}



