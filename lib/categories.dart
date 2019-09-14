
import 'package:mybudget/database_creator.dart';

class Category {
  int id;
  String name;
  double budgeted;
  double available;

  Category(this.id, this.name, this.budgeted, this.available);

  //TODO: Combine database creation with frontend creation
}

class SubCategory extends Category {

  final parentId;

  SubCategory(int id, int parentId, String name, double budgeted, double available) : 
    parentId = parentId,
    super(id, name, budgeted, available);

  // Subcategories are imported from the database as json file
  SubCategory.fromJson(Map<String, dynamic> json) :
    parentId = json[DatabaseCreator.CAT_ID_OUTSIDE],
    super(
      json[DatabaseCreator.SUBCAT_ID],
      json[DatabaseCreator.SUBCAT_NAME],
      json[DatabaseCreator.SUBCAT_BUDGETED],
      json[DatabaseCreator.SUBCAT_AVAILABLE]);

  /// Convert a SubCategory into a Map. 
  Map<String, dynamic> toMap() {
    return {
      DatabaseCreator.SUBCAT_ID: id,
      DatabaseCreator.SUBCAT_NAME: name,
      DatabaseCreator.SUBCAT_BUDGETED: budgeted,
      DatabaseCreator.SUBCAT_AVAILABLE: available,
    };
  }
}

class MainCategory extends Category {

  List<SubCategory> subcategories = [];

  MainCategory(int id, String name) : 
    super(id, name, 0.00, 0.00);

  /// Categories are imported from the database as json file
  MainCategory.fromJson(Map<String, dynamic> json) :
    super(
      json[DatabaseCreator.CATEGORY_ID],
      json[DatabaseCreator.CATEGORY_NAME],
      0.00,
      0.00);

  /// Convert a MainCategory into a Map. 
  Map<String, dynamic> toMap() {
    return {
      DatabaseCreator.CATEGORY_ID: id,
      DatabaseCreator.CATEGORY_NAME: name,
    };
  }
  
  
  void updateFields(){
    double budgeted = 0;
    double available = 0;
    subcategories.forEach((SubCategory cat){budgeted += cat.budgeted;});
    subcategories.forEach((SubCategory cat){available += cat.available;});

    this.budgeted = budgeted;
    this.available = available;
  }

  void addSubcategory(SubCategory newSub){// String subCategoryName, double budgeted, double available){
  //   SubCategory newSub = SubCategory(name: subCategoryName, 
  //                                   budgeted : budgeted,
  //                                   available : available);
    print("Adding ${newSub.name} to ${this.name}");
    this.subcategories.add(newSub);
    updateFields();
  }
}