import 'package:watch_store/data/config/api_constant.dart';

class SortModel {
  int id;
  String title;
  String sortRout;

  SortModel({required this.id, required this.title, required this.sortRout});
}

List<SortModel> sortList = [
  SortModel(
      id: 1,
      title: "گران ترین ها",
      sortRout: ProductSortRoute.mostExpensiveProducts),
  SortModel(
      id: 2,
      title: "ارزان ترین ها",
      sortRout: ProductSortRoute.cheapestProducts),
  SortModel(
      id: 3,
      title: "پر فروش ترین ها",
      sortRout: ProductSortRoute.mostViewedProducts),
  SortModel(
      id: 4, title: "جدیدترین ها", sortRout: ProductSortRoute.newestProducts),
];
