import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../constant.dart';
import '../../controller/Getpopuler.dart';
import '../../controller/apis.dart';
import '../Description.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [Icon(Icons.search),],
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("Movies",style: TextStyle(color: Colors.red),),
        centerTitle: true,
      ),
      body: Column(
        children: [
        Consumer(builder:(context, ref, child){
          final viewmodel= ref.watch(getdata);

          return CarouselSlider.builder(
              itemCount: viewmodel.listDataModel.length,
              itemBuilder: (context , itemIndex,PageViewIndex){
                return GridTile(child: Image.network(image_url+viewmodel.listDataModel[itemIndex].poster_path,
                fit: BoxFit.fill,
                ),
                footer: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8),
                  color: Colors.red.withOpacity(0.5),
                  child: Text(viewmodel.listDataModel[itemIndex].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),),
                ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.5,
                enlargeCenterPage: true,
                reverse: true,
                height: MediaQuery.of(context).size.height/3,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                scrollDirection: Axis.horizontal,
                initialPage: 0,
                viewportFraction: 0.7,
                enableInfiniteScroll: false,
                autoPlayCurve: Curves.fastOutSlowIn,
              ));
        },),
          Expanded(
              child: Consumer(
            builder: (context,ref, child) {
            final viewmodelpopular = ref.watch(getdatapop);
            return StaggeredGridView.countBuilder(
              crossAxisCount:2,
              itemCount: viewmodelpopular.listDataModel.length,
              itemBuilder:(context,index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
                      return Description(backdrop_path: image_url + viewmodelpopular.listDataModel[index].backdrop_path, poster_path: image_url + viewmodelpopular.listDataModel[index].poster_path, title: viewmodelpopular.listDataModel[index].title, vote_average: viewmodelpopular.listDataModel[index].vote_average, id: viewmodelpopular.listDataModel[index].id, original_title: viewmodelpopular.listDataModel[index].original_title, overview: viewmodelpopular.listDataModel[index].overview,);
                    }));
                  },
                  child: Card(
                    color: red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.network(image_url + viewmodelpopular.listDataModel[index].poster_path,
                            fit: BoxFit.cover,
                          ),
                          Text(viewmodelpopular.listDataModel[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),),

                        ]

                      ),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index)=>StaggeredTile.fit(1),

            );
          },))
        ],
      ),
    );
  }
}
