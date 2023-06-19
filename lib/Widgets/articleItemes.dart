import 'package:flutter/material.dart';
import 'package:news_app/Cubits/cubit.dart';
import 'package:news_app/Layouts/WebViewScreen.dart';

Widget articleBuildItem(context, list) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => WebViewScreen(
                    url: '${list['url']}',
                  ))));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                color: NewCubit.get(context).isdark == true
                    ? Colors.grey[600]
                    : Colors.black38,
                image: DecorationImage(
                  image: NetworkImage('${list['urlToImage']}'),
                  // to make image take the container space
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(width: 20),
          Expanded(
              child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "${list['title']}",
                    style: NewCubit.get(context).isdark == true
                        ? const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)
                        : const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "${list['publishedAt']}",
                  style: NewCubit.get(context).isdark == true
                      ? TextStyle(fontSize: 10, color: Colors.grey[500])
                      : const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                ),
              ],
            ),
          ))
        ],
      ),
    ),
  );
}

Widget divider(context) {
  return Divider(
    color: NewCubit.get(context).isdark == true
        ? Colors.grey[700]
        : Colors.grey[300],
    height: 10,
  );
}
