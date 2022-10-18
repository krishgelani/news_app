import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class detailScreen extends StatefulWidget {
  const detailScreen({Key? key}) : super(key: key);

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff363535),
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back_outlined),),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.favorite_border),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.bookmark_outline),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.share),
          ),
        ],
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 20,),

            InkWell(onTap: (){},
              child: Container(
                height: 300,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: "${Provider.of<homeProvider>(context,listen: false).datapicker!.urlToImage}",
                  placeholder: (context,_)=>Center(child: Text("ERROR LOADING!")),
                  errorWidget: (context,_,__)=>Center(child: Text("ERROR LOADING!")),
                ),
              ),
            ),

            Container(margin: EdgeInsets.symmetric(vertical: 20),width: MediaQuery.of(context).size.width*0.9,child: Text("${Provider.of<homeProvider>(context,listen: false).datapicker!.title}",style: TextStyle(fontSize: 22,color: Colors.white ,fontWeight: FontWeight.bold),)),

            SizedBox(height: 25,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              color:Color(0xff363535),
              height: 280,
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: MediaQuery.of(context).size.width*0.85,child: Text("${Provider.of<homeProvider>(context,listen: false).datapicker!.content}",style: TextStyle(color: Colors.white),)),
                  ),
                  SizedBox(height: 15,),
                  Container(height: 1,width: double.infinity,color: Colors.white,),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("For More Details Click This Link",style: TextStyle(color: Colors.white54),),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/web');
                          },
                          child: Text("click Here!")
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
