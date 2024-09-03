import 'package:flutter/material.dart';
import 'package:technews/backend/functions.dart';
import 'package:technews/components/newsbox.dart';
import 'package:technews/components/searchbar.dart';
import 'package:technews/utils/appbar.dart';
import 'package:technews/utils/colors.dart';
import 'package:technews/utils/constants.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.bgColor,
      appBar: const appbar(),
      body: SafeArea(
          child: Column(
        children: [
          SearchBars(),
          Expanded(
              child: Container(
                  width: w,
                  height: MediaQuery.of(context).size.height,
                  child: FutureBuilder(
                      future: fetchnews(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return NewsBox(
                                    imageurl: snapshot.data![index]['urlToImage'] != null
                                        ? snapshot.data![index]['urlToImage']
                                        : Constants.imageurl,
                                    title: snapshot.data![index]['title'],
                                    time: snapshot.data![index]['publishedAt'],
                                    description: snapshot.data![index]
                                            ['description']
                                        .toString(),
                                    url: snapshot.data![index]['url']);
                              });
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            color: Appcolors.primary,
                          ),
                        );
                      })))
        ],
      )),
    );
  }
}
