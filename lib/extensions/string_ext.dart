extension StringExt on String {
  String prefixZero() {
    return "0$this";
  }

  String prefixDash() {
    return "- $this";
  }
}
