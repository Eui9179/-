class GameSelection {
  final String name;
  bool isSelected;

  GameSelection({required this.name, this.isSelected = false});

  void toggle() {
    isSelected = !isSelected;
  }
}