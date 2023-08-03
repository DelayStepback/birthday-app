String formatGuestsCount(int index) {
  int ln = index % 10;

  if (ln == 1) {
    return 'гость';
  }
  if (ln == 2 || ln == 3 || ln == 4) {
    return 'гостя';
  }
  return 'гостей';
}
