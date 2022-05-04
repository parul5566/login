
import 'package:flutter/material.dart';
import 'package:login/pages/post_detail.dart';

import '../../services/http_service.dart';
import '../Model/post_model.dart';




class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();
   PostsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        title: Text("transactions"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;
            return ListView(
              children: posts!
                  .map(
                    (Post post) => InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  PostDetail(post: post)),
                        );
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Text("${post.id}"),
                            SizedBox(height: 10),
                            Text("${post.userId}"),
                            SizedBox(height: 20),
                            Text(post.title),

                          ],
                        ),
                      ),
                    ),
              )
                  .toList(),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}