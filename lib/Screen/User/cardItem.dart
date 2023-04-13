

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_project/Model/User/User.dart';

class CardItem extends StatelessWidget {
  final Function editItem;
  final Function deleteItem;
  final User user;
  const CardItem({Key? key, required this.user,required this.editItem,required this.deleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(color: Colors.grey),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      child:
      Row(
       
        children:  [
          CachedNetworkImage(
                  imageUrl: user.avatarUrl,

              imageBuilder: (context, imageProvider) => Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: imageProvider, fit: BoxFit.cover),
                ),
                ),
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
               ),
          Container(
            padding: const EdgeInsets.only(left:10),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text("${user.firstName} ${user.lastName}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text(user.email, style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
            ],
          )
    ) , const Spacer(),
          Container(
            alignment: Alignment.centerRight,
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  editItem();
                },
                child:  const Icon(Icons.edit,color: Colors.greenAccent,),
              ) ,
              InkWell(
                onTap: (){
                 deleteItem();
                },
                child: const Icon(Icons.delete,color: Colors.red,),
              )
            ],
          ),
          )
        ],
      )
      ,
    );
  }
}
