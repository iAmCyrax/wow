extension CapitalizeExtension on String {
  String capitalize() {
    return length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  }

  String toTitleCase() {
    return replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.capitalize()).join(' ');
  }
}
