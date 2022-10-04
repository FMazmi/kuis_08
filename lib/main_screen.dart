import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kuis/detail_view.dart';
import 'package:kuis/game_store.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _rating = 4.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26.withOpacity(0.8),
        appBar: AppBar(
          title: Text('List Game'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final GameStore game = gameList[index];
            double rating;

            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              game: game,
                            )));
              },
              child: Card(
                elevation: 50,
                shadowColor: Colors.purple,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      // width: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.yellow,
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          colorFilter: ColorFilter.mode(
                              Colors.green.withOpacity(0.6), BlendMode.dstOut),
                          image: NetworkImage(game.imageUrls[0]),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            game.name,
                            style: TextStyle(
                                // backgroundColor: Colors.deepPurpleAccent,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ],
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rating : ${game.reviewAverage}',
                            style: TextStyle(shadows: [
                              Shadow(
                                  color: Colors.white,
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ], fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          RatingBar(
                            initialRating: 3.5,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20.0,
                              ratingWidget: RatingWidget(
                                  full: const Icon(Icons.star, color: Colors.red,),
                                  half: const Icon(Icons.star_half, color: Colors.red,),
                                  empty: const Icon(Icons.star_outline, color: Colors.red,)),
                              onRatingUpdate: (value){
                              _rating = value;
                          }),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            game.price,
                            style: TextStyle(shadows: [
                              Shadow(
                                  color: Colors.white,
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ], fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: gameList.length,
        ));
  }
}
