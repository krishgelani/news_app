import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/newsModel.dart';
import 'package:news_app/view/secondScreen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../provider/SecondScreenProvider.dart';
import '../provider/homeProvider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  homeProvider? providerfalse;
  homeProvider? providertrue;

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<homeProvider>(context, listen: false);
    providertrue = Provider.of<homeProvider>(context, listen: true);
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Color(0xff363535),
              title: Text("News App"),
              centerTitle: true,
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.greenAccent,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    child: Text("For You"),
                  ),
                  Tab(
                    child: Text("Tesla"),
                  ),
                  Tab(
                    child: Text("Cricket"),
                  ),
                  Tab(
                    child: Text("Mobile"),
                  ),
                  Tab(
                    child: Text("Entertainment"),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                homeScreenview(),
                SecondScreen(),
                homeScreenview(),
                homeScreenview(),
                homeScreenview()
              ],
            )),
      ),
    );
  }

  Widget homeScreenview() {
    return Column(
      children: [
        Container(
          height: 65,
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Select Your Country",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/country');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff363535),
                  ),
                  child: Text(
                      "${Provider.of<SecondScreenProvider>(context, listen: true).countryname}"),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: Provider.of<SecondScreenProvider>(context, listen: false)
                .newsapi(
                    Provider.of<SecondScreenProvider>(context, listen: false)
                        .country),
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
      ],
    );
  }
}
