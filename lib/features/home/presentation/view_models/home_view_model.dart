import 'package:flutter/widgets.dart';

class HomeViewModel extends ChangeNotifier {
  int bottomNavigationBarIndex = 0;

  void changeBottomNavigationBarIndex(int index) {
    bottomNavigationBarIndex = index;
    notifyListeners();
  }

}
