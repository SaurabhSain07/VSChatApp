import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vschatapp/Controller/contactController.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/pages/homePage/widgets/chatTile.dart';

class NewGroup extends StatelessWidget {
  const NewGroup({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController=Get.put(ContactController());
    return Scaffold(
      appBar: AppBar(title:const Text("New Group"),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.arrow_forward),
      ),
      body: StreamBuilder(stream:contactController.getContact() ,
       builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      }
                      if (snapshot.data == null) {
                        return const Center(
                          child: Text("No Messages"),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ChatTile(
                              imageUrl: snapshot.data![index].profileImage?? AssetsImage.defaultProfileImage,
                              name: snapshot.data![index].name!,
                              lastChat: snapshot.data![index].about ?? "",
                              lastTime: "");
                          },
                        );
                      }
       }),
    );
  }
}