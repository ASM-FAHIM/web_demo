import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class RegisteredPatient extends StatefulWidget {
  const RegisteredPatient({Key? key}) : super(key: key);

  @override
  State<RegisteredPatient> createState() => _RegisteredPatientState();
}

class _RegisteredPatientState extends State<RegisteredPatient> {
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
                        color: Colors.blue,
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
                        Expanded(child: Text(title)),
                      ],
                    ),
                    textColor: Colors.black,
                  ),
                  Container(
                    width: size.width / 1.2,
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
