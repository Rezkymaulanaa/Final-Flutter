import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:blur/blur.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('images/image5.jpg'),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
                child: Text('Get Started'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final myItems = [
    Image.asset('images/image1.jpg'),
    Image.asset('images/image2.jpg'),
    Image.asset('images/image3.jpg'),
    Image.asset('images/image4.jpg'),
    Image.asset('images/image5.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hi, Alif Rezky Maulana',
                        style: TextStyle(
                          fontSize: 14, // Sesuaikan ukuran font sesuai kebutuhan
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Blur(
                                        blur: 5.0,
                                        blurColor: const Color.fromARGB(255, 120, 120, 120),
                                        child: Container(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: CircleAvatar(
                                        radius: 100,
                                        backgroundImage: AssetImage('images/alip.jpg'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/alip.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0), // Adjust top margin here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Tempat Favorit',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: 500,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
                viewportFraction: 0.8,
                aspectRatio: 16/9,
              ),
              items: myItems,
            ),
          ],
        ),
      ),
    );
  }
}
