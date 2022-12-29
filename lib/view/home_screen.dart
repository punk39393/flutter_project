import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/view/widget/simple_app_bar.dart';
import '../controllers/dashboard_controller.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<DashBoardController>(
        init: DashBoardController(),
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(appBar_title: 'Homepage'),
            body: controller.loading.value
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    // children: controller.ordersDetails.data<Widget>((post) => ListTile(
                    //           leading: Text(post.id.toString()),
                    //           title: Text(post.title),
                    //           subtitle: Text(post.body),
                    //           trailing: Text('User ${post.userId}'),
                    //         ))
                    //     .toList(),
                  ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
               // controller.sendPost();
              },
            ),
          );
   });
  }
}

