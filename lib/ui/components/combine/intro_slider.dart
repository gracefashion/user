import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'intro_slider_item.dart';

class IntroSlider extends StatelessWidget {
  List<String> photos;
  IntroSlider({required
    this.photos
  });
  @override
  Widget build(BuildContext context) {

    return (photos.length == 0 ) ?
    Container(color: Colors.grey,) :
    Container(
      height: 28.125 * 7,
      //color: Colors.blueAccent,
      child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            initialPage: 2,
            height: 28.125 * 6.5,
            enableInfiniteScroll: true,
          ),
          items: List.generate(photos.length, (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 450,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: IntroSliderItem(photo:photos[index]),
            ),
          ))
      ),
    );
  }
}
