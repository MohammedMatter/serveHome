import 'package:flutter/widgets.dart';

class HomeViewModel extends ChangeNotifier {
  int bottomNavigationBarIndex = 0;
  int drowerIndex = 0;
  String status = '';
  void changeBottomNavigationBarIndex(int index) {
    bottomNavigationBarIndex = index;
    notifyListeners();
  }

  void changeDrowerIndex(int drowerIndex) {
    this.drowerIndex = drowerIndex;
    notifyListeners();
  }
  void changeStatus(String status) {
    this.status = status;
    notifyListeners();
  }
}
