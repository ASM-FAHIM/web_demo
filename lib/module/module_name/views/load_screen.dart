import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({Key? key}) : super(key: key);

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  HomeController home = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:  Obx(() {
        return home.isLoading1.value
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: const CircularProgressIndicator(
                  color: Colors.purple,
                ),
              ),
              const Text(
                'Loading...',
                style: TextStyle(color: Colors.black, fontSize: 20),
              )
            ],
          ),
        )
            : Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: ListView.builder(
            itemCount: home.movieList.length,
            itemBuilder: (context, index) {
              var movies = home.movieList[index];
              int id = movies.id;
              String title = movies.title;
              String imageUrl = movies.thumbnailUrl;
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      /*Get.to(() => DetailsScreen(
                        title: title,
                        imageUrl: imageUrl,
                      ));*/
                    },
                    leading: Container(
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(imageUrl),
                        ),
                      ),
                    ),
                    title: Row(
                      children: [
                        Text('$id. '),
                        Text(title),
                      ],
                    ),
                    textColor: Colors.black,
                  ),
                  Container(
                    width: size.width / 1.5,
                    child: Divider(
                      thickness: 1.2,
                      color: Colors.grey,
                    ),
                  ),
                ],
              );
            },
            controller: home.scrollController,
          ),
        );
      }),
    );
  }
}
