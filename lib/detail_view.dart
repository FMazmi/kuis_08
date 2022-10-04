import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:kuis/game_store.dart';

class DetailPage extends StatefulWidget {
  final GameStore game;

  const DetailPage({Key? key, required this.game}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isFavorite) ? Colors.green.withOpacity(0.7) : Colors.white,
        appBar: AppBar(
          title: Text('${widget.game.name}'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: (isFavorite)
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
            ),
            IconButton(
              onPressed: () {
                  html.window.open(widget.game.linkStore, '');

                // _launchURLBrowser(widget.game.linkStore);
                // _launchURLBrowser();
              },
              icon: Icon(Icons.store),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 220.00,
              decoration: BoxDecoration(
                color: (isFavorite) ? Colors.yellow : Colors.white,
              ),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: widget.game.imageUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      // color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 6.0,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        widget.game.imageUrls[index],
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        // height: 210,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.game.name,
                    style: TextStyle(
                        color: (isFavorite)
                            ? Colors.yellow
                            : Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.game.tags}',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'Price : ${widget.game.price}',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'About Game',
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      widget.game.about,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
