import '../../config.dart';

class FilterProvider with ChangeNotifier {
  int selectedFilterIndex = 0;
  bool isVisible = true;
  List selectedColor = [];
  List selectDimension = [];
  int selectIndex = 0;
  bool isSelectColor = false;

//select sort by
  onSelectSortByMethod(index) {
    selectIndex = index;
    notifyListeners();
  }

  RangeValues valueRangeData = const RangeValues(0.0, 100.0);

  RangeValues get valueRange => valueRangeData;

//price value selected
  void updateValueRangeData(RangeValues newValues) {
    valueRangeData = newValues;
    notifyListeners();
  }

//selected index
  void updateSelectedIndex(int index) {
    selectedFilterIndex = index;
    notifyListeners();
  }

//color checkbox
  isCheckBoxColor(value) {
    if (selectedColor.contains(value)) {
      selectedColor.remove(value);
    } else {
      selectedColor.add(value);
    }
    notifyListeners();
  }

  //select all
  isSelectAll(List filterData) {
    isSelectColor = !isSelectColor;
    if(isSelectColor == false){
      selectedColor = [];
      notifyListeners();
    }else {
      for (var item in filterData) {
        if (selectedColor.contains(item['colorCode'])) {
          selectedColor.remove(item['colorCode']);
        } else {
          selectedColor.add(item['colorCode']);
        }
      }
    }
    notifyListeners();
  }

//dimension check box
  isCheckBoxDimension(value) {
    if (selectDimension.contains(value)) {
      selectDimension.remove(value);
    } else {
      selectDimension.add(value);
    }
    notifyListeners();
  }

  //clear filter
  clearFilter(context) {
    isSelectColor = false;
    selectedColor = [];
    selectDimension = [];
    valueRangeData = const RangeValues(0.0, 100.0);
    selectIndex = 0;
    route.pop(context);
    notifyListeners();
  }
}
