
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flip_card/flip_card.dart';
import 'dart:ui'as ui;
class Description extends StatefulWidget {
  int id;
  String original_title;
  String overview;
  String poster_path;
  String backdrop_path;
  String title;
  num vote_average;

  @override
  State<Description> createState() => _DescriptionState();

  Description({
    required this.id,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.backdrop_path,
    required this.title,
    required this.vote_average,
  });
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Image.network(widget.poster_path,
              fit: BoxFit.fill,
            ),
          ),
          BackdropFilter(filter: ui.ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: Container(
            color: Colors.red.withOpacity(0.2),
          ),),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/24,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: TextButton.icon(onPressed:(){
                      Navigator.pop(context);
                    } , icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 25,) , label: Text("Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: ui.FontWeight.w800
                    ),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/24,),
                  FlipCard(
                    fill: Fill.fillFront,
                    front: Container(
                      height: MediaQuery.of(context).size.height/1.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: NetworkImage(
                          widget.poster_path,

                        ),
                        fit: BoxFit.fill),
                      ),
                    ),
                    back: Container(
                      height: MediaQuery.of(context).size.height/1.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: NetworkImage(
                          widget.backdrop_path,

                        ),
                            fit: BoxFit.fill),
                      ),
                    ),
                    direction: FlipDirection.HORIZONTAL,
                  ),
                  Row(
                    children: [
                      Text("${widget.title} ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0
                      ),
                      ),
                      Text("${widget.vote_average} ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0
                        ),
                      ),
                    ],
                  ),
                  Text("${widget.overview}",
                    style: TextStyle(
                        color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
