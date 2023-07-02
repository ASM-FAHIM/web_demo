import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constant/app_url.dart';
import '../model/movie_list_model.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Text('Api load', style: TextStyle(color: Colors.grey)),
        ),
    Tab(
      child: Text('Regi form', style: TextStyle(color: Colors.grey)),
    ),
    Tab(
      child: Text('Cart page', style: TextStyle(color: Colors.grey)),
    )
  ];

  RxBool change = true.obs;
  var movieList = <MovieListModel>[].obs;
  RxBool isLoading1 = false.obs;

  void fetchPendingSoList() async {
    String completeUrl = 'https://jsonplaceholder.typicode.com/photos/';
    print('========$completeUrl');
    try {
      isLoading1(true);
      var response = await http.get(Uri.parse(completeUrl));
      var soList = movieListModelFromJson(response.body);
      movieList.assignAll(soList.map((e) => e));
    } finally {
      isLoading1(false);
    }
  }

  final scrollController = ScrollController();
  final displayedData = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;

  final dataList = <Map<String, dynamic>>[
    // Add your data here or fetch it from an API
  ];

  final itemsPerPage = 10;
  var currentPage = 1;

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 3, vsync: this);
    fetchNextPage(); // Fetch the first page of data when the controller is initialized
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    tabController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  Future<void> fetchNextPage() async {
    if (isLoading.value) return;

    isLoading.value = true;

    await Future.delayed(Duration(seconds: 2));

    final newData = dataList
        .skip((currentPage - 1) * itemsPerPage)
        .take(itemsPerPage)
        .toList();

    displayedData.addAll(newData);

    currentPage++;

    isLoading.value = false;
  }

  void _scrollListener() {
    if (scrollController.position.maxScrollExtent ==
        scrollController.position.pixels) {
      fetchNextPage();
    }
  }

}