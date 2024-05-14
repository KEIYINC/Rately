import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Oylama extends StatefulWidget {
  const Oylama({Key? key}) : super(key: key);

  @override
  State<Oylama> createState() {
    return _OylamaState();
  }
}

class _OylamaState extends State<Oylama> {
  double _rating = 0;
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.deepOrange,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1554080353-a576cf803bda?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGhvdG98ZW58MHx8MHx8fDA%3D',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Slider(
                    value: _sliderValue,
                    min: 0.0,
                    max: 5,
                    onChanged: (newValue) {
                      setState(() {
                        _sliderValue = newValue;
                        _rating =
                            newValue; // Slider değeri RatingBar'a aktarılıyor
                      });
                    },
                  ),
                  Flexible(
                    flex: 1,
                    child: RatingBar.builder(
                      initialRating: _rating,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, index) {
                        if (index < 1) {
                          return Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.amber,
                          );
                        } else if(index < 2){
                          return Icon(
                            Icons.emoji_events,
                            color: Color.fromARGB(255, 208, 41, 175),
                          );
                        }
                        else if(index < 3){
                          return Icon(
                            Icons.home,
                            color: Color.fromARGB(255, 41, 215, 93),
                          );
                        }
                        else if(index < 4){
                          return Icon(
                            Icons.smart_display,
                            color: Color.fromARGB(255, 43, 157, 233),
                          );
                        }
                        else{
                          return Icon(
                            Icons.alarm,
                            color: Color.fromARGB(255, 131, 72, 9),
                          );
                        }
                      },
                      onRatingUpdate: (rating) {
                        setState(() {
                          _rating = rating;
                          _sliderValue =
                              rating; // RatingBar değeri Slider'a aktarılıyor
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}