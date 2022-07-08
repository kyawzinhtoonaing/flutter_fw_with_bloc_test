mixin SymbolCreationPageValidator {
  String? numberValidation(String? text) {
    if (text!.trim().isEmpty) {
      return "Please enter some text!";
    }

    if (int.tryParse(text) == null) {
      return "Text must be number";
    }

    return null;
  }

  String? textValidation(String? text) {
    if (text!.trim().isEmpty) {
      return "Please enter some text!";
    }

    return null;
  }
}