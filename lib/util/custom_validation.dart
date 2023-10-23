class CustomValidation{
    static bool isNumeric(String str) {
      if (str == '') return false;
      return double.tryParse(str) != null;
    }
}