import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/pages/Chats/Widgets/ChatBubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(AssetsImage.girl),
          ),
          title: Text.rich(
            TextSpan(
                text: "Nandni Sain\n",
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(
                      text: "Online",
                      style: Theme.of(context).textTheme.labelSmall)
                ]),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call_sharp),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.videocam_outlined))
          ],
        ),
        
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin:const EdgeInsets.all(10),
          padding:const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(100)),
          child: Row(
            children: [
              SvgPicture.asset(AssetsImage.micSVG),
             const SizedBox(width: 10,),
             const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Type message...",
                    filled: false),
                )
                ),
              const SizedBox(width: 10,),
              SvgPicture.asset(AssetsImage.gallerySVG),
              const SizedBox(width: 10,),
              SvgPicture.asset(AssetsImage.sendSVG),  
            ],
          )
         ),
        
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children:const [
              Column(
                children: [
                  
                  ChatBubble(
                    message: 'Hii',
                    imageUrl: "",
                    status: "read",
                    isComming: true,
                    time: '10:10 Am',
                  ),
              
                  ChatBubble(
                    message: 'Hello',
                    imageUrl: "",
                    status: "read",
                    isComming: false,
                    time: '10:10 Am',
                  ),
              
                  ChatBubble(
                    message: 'Hello',
                    imageUrl: "https://t3.ftcdn.net/jpg/05/59/87/12/360_F_559871209_pbXlOVArUal3mk6Ce60JuP13kmuIRCth.jpg",
                    status: "read",
                    isComming: false,
                    time: '10:10 Am',
                  ),
      
                  ChatBubble(
                    message: 'Ram Ram Ji',
                    imageUrl: "",
                    status: "read",
                    isComming: true,
                    time: '10:10 Am',
                  ),
      
                  ChatBubble(
                    message: 'Hello',
                    imageUrl: "https://t3.ftcdn.net/jpg/05/59/87/12/360_F_559871209_pbXlOVArUal3mk6Ce60JuP13kmuIRCth.jpg",
                    status: "read",
                    isComming: true,
                    time: '10:10 Am',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
