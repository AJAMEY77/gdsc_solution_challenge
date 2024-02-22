import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cropDoc extends StatefulWidget {
  const cropDoc({Key? key}) : super(key: key);

  @override
  State<cropDoc> createState() => _cropDocState();
}

class _cropDocState extends State<cropDoc> {
  late final PageController pageController;
  int pageNo = 0;

  Timer? carouselTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 2) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carouselTimer = getTimer();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CropDoctor"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  pageNo = index;
                  setState(() {});
                },
                itemBuilder: (_, index) {
                  return AnimatedBuilder(
                    animation: pageController,
                    builder: (ctx, child) {
                      return child!;
                    },
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Hello you tapped at ${index + 1} "),
                          ),
                        );
                      },
                      onPanDown: (d) {
                        carouselTimer?.cancel();
                        carouselTimer = null;
                      },
                      onPanCancel: () {
                        carouselTimer = getTimer();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: 8, left: 8, top: 24, bottom: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: Colors.amberAccent,
                          image: DecorationImage(
                            image: NetworkImage(
                              gridMapThreeImages[index]['images'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 3, // Display only 3 images
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                mainAxisExtent: 270,
              ),
              itemCount: gridMap.length,
              itemBuilder: (_, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.amberAccent.shade100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                        child: Image.network(
                          "${gridMap.elementAt(index)['images']}",
                          height: 170,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${gridMap.elementAt(index)['title']}",
                              style:
                                  Theme.of(context).textTheme.subtitle1!.merge(
                                        const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "${gridMap.elementAt(index)['price']}",
                              style:
                                  Theme.of(context).textTheme.subtitle2!.merge(
                                        TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox.shrink(), // No bottom navigation bar
    );
  }

  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Crop Data",
      // "price": "\$255",
      "images": "https://i.postimg.cc/Jnq8QmjF/c1.png",
    },
    {
      "title": "Crop Data",
      // "price": "\$255",
      "images": "https://i.postimg.cc/PJ5j3c45/c2.jpg",
    },
    {
      "title": "Crop Data",
      // "price": "\$255",
      "images": "https://i.postimg.cc/Gtg1ZQ7J/c3.jpg",
    },
    {
      "title": "Crop Data",
      // "price": "\$255",
      "images": "https://i.postimg.cc/QxVDc2C6/c4.webp",
    },
    {
      "title": "Crop Data",
      // "price": "\$255",
      "images": "https://i.postimg.cc/m2qsjmFT/c5.webp",
    },
    {
      "title": "Crop Data",
      // "price": "\$255",
      "images": "https://i.postimg.cc/Jnq8QmjF/c1.png",
    },
    {
      "title": "Crop Data",
      // "price": "\$255",
      "images": "https://i.postimg.cc/59s1Y44Y/c6.webp",
    }
  ];

  final List<Map<String, dynamic>> gridMapThreeImages = [
    {
      "title": "White sneakers with Adidas logo",
      "price": "\$255",
      "images": "https://i.postimg.cc/q7tbXDWt/carousel-1.png",
    },
    {
      "title": "Black Jeans with blue stripes",
      "price": "\$245",
      "images": "https://i.postimg.cc/TYYK4z04/carousel-2.jpg",
    },
    {
      "title": "Red shoes with black stripes",
      "price": "\$155",
      "images": "https://i.postimg.cc/1382Jzq5/carousel-3.jpg",
    },
  ];
}
