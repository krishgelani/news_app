import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/newsModel.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../provider/homeProvider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  homeProvider? providerfalse;
  homeProvider? providertrue;
  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<homeProvider>(context, listen: false);
    providertrue = Provider.of<homeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: Provider.of<homeProvider>(context, listen: false).newsteslaapi(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              NewsModel data = snapshot.data!;
              return ListView.builder(
                itemCount: data.articles!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      providerfalse!.datapicker = data.articles![index];
                      Navigator.pushNamed(context, '/detail');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: CachedNetworkImage(
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.fill,
                                imageUrl:
                                "${data.articles![index].urlToImage}",
                                placeholder: (context, _) =>
                                    Center(child: Text("ERROR LOADING!")),
                                errorWidget: (context, _, __) =>
                                    Center(child: Text("ERROR LOADING!")),
                              ),
                            ),
                            Text(
                              "${data.articles![index].title}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return Shimmer.fromColors(
              baseColor: Colors.black12,
              highlightColor: Colors.white12,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 150,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 16,
                          color: Colors.white,
                          width: double.infinity,
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
