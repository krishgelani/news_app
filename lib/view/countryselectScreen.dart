import 'package:flutter/material.dart';
import 'package:news_app/model/CountryModel.dart';
import 'package:news_app/provider/SecondScreenProvider.dart';
import 'package:provider/provider.dart';

class cselectScreen extends StatefulWidget {
  const cselectScreen({Key? key}) : super(key: key);

  @override
  State<cselectScreen> createState() => _cselectScreenState();
}

class _cselectScreenState extends State<cselectScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: Icon(Icons.arrow_back),),
          backgroundColor: Color(0xff363535),
          title: Text("Select Country"),
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (1 / .55),
          children: List.generate(20, (index) {
              return GestureDetector(
                onTap: (){

                  Provider.of<SecondScreenProvider>(context,listen: false).changeCountry(Provider.of<SecondScreenProvider>(context,listen: false).countrydetails[index].code as String,Provider.of<SecondScreenProvider>(context,listen: false).countrydetails[index].name as String);

                  Provider.of<SecondScreenProvider>(context,listen: false).namepicker = CountryModel(
                    name: Provider.of<SecondScreenProvider>(context,listen: false).countrydetails[index].name,
                  );

                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          child: Image.network(Provider.of<SecondScreenProvider>(context,listen: false).countrydetails[index].image as String),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("${Provider.of<SecondScreenProvider>(context,listen: false).countrydetails[index].name}", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
