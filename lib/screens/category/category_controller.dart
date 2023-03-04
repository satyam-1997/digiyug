import 'package:digiyug/screens/category/category_list_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  Rx<List<CategoryModel>> categoryList = Rx<List<CategoryModel>>([]);
  Rx<List<CategoryModel>> selectedcategoryList = Rx<List<CategoryModel>>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    assignCatList();
  }

  assignCatList() {
    categoryList.value = [
      CategoryModel(
        name: "Political",
        svgPath: "political.png",
        isSelected: false,
      ),
      CategoryModel(
        name: "Common people \n/ Store operator",
        svgPath: "common_people.png",
        isSelected: false,
      ),
      CategoryModel(
        name: "Local Business",
        svgPath: "local_business.png",
        isSelected: false,
      ),
      CategoryModel(
        name: "School / Collage / \nHospital / Firms",
        svgPath: "school.png",
        isSelected: false,
      ),
      CategoryModel(
        name: "Social worker",
        svgPath: "social_worker.png",
        isSelected: false,
      ),
      CategoryModel(
        name: "Co-operative \nsocieties",
        svgPath: "co-operative.png",
        isSelected: false,
      ),
    ];
  }

  setIsSelected(int index) {
    if (categoryList.value[index].isSelected == true) {
      selectedcategoryList.value.removeWhere((element) {
        if (element == categoryList.value[index]) {
          return true;
        }
        return false;
      });
      categoryList.value[index].isSelected = false;
    } else {
      categoryList.value[index].isSelected =
          !categoryList.value[index].isSelected;
      selectedcategoryList.value.add(categoryList.value[index]);
    }
  }
}
