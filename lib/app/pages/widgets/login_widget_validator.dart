mixin LoginWidgetValidator {
  String? mailValidation(String? text) {
    if (text!.trim().isEmpty) {
      return "Please enter some text!";
    }

    if (!text.contains("@")) {
      return "The input text must be mail!";
    }

    return null;
  }
}