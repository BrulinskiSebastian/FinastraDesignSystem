extension StringExt on String {
  String? takeIfNotNull() => trim().isNotEmpty ? this : null;
}
