import 'package:apps3_in_1/constraints.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ecommerce extends StatefulWidget {
  @override
  _ecommerceState createState() => _ecommerceState();
}

List<dynamic> images = [
  "images/backlit.jpeg",
  "images/iphone12.jpeg",
  "images/macbook pro.jpeg",
  "images/Macbook air.jpeg",
  "images/mercedes.jpeg",
  "images/monitor.jpeg",
  "images/Mutton.jpeg",
  "images/note20.jpeg",
];

List<dynamic> msg = [
  "Backlit ",
  "Iphone 12",
  "Macbook Pro",
  "Macbook Air",
  "Mercedes",
  "Monitor",
  "Mutton",
  "Note 20"
];

List<dynamic> img = [
  Icons.inventory,
  Icons.tv,
  Icons.fitness_center,
  Icons.house,
  Icons.arrow_forward,
];

List<dynamic> name = [
  "Clothes",
  "Elctronic",
  "Equipment",
  "Household",
  "Others",
];

class _ecommerceState extends State<ecommerce> {
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ecomm App UI",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ],
        backgroundColor: primaryColor,
      ),
      body: ListView(
        children: [
          header(),
          CarouselSlider.builder(
            itemCount: images.length,
            options: CarouselOptions(
              height: 260.0,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              autoPlay: true,
            ),
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              child: MovingItems(itemIndex),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "More Categories",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            width: 50,
            height: 45,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => Card(
                child: Container(
                  color: Colors.white,
                  width: 130,
                  height: 35,
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        img[index],
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${name[index]}",
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "5 Items",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Items",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "View More",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.purple,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 15,
            shrinkWrap: true,
            children: List.generate(images.length, (index) {
              return Container(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(left: 8, right: 8),
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image(
                          image: AssetImage("${images[index]}"),
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 5,
                          right: 5,
                          bottom: 8,
                        ),
                        alignment: Alignment.bottomLeft,
                        width: MediaQuery.of(context).size.width,
                        height: 20,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${msg[index]}",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 12,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 12,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 12,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 12,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 12,
                                ),
                                Text(
                                  "5.0 (23 Reviews)",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                minWidth: 80,
                onPressed: () {
                  setState(() {
                    currentTab = 0;
                  });
                },
                child: Icon(Icons.home,
                    color: currentTab == 0 ? primaryColor : Colors.grey),
              ),
              MaterialButton(
                minWidth: 80,
                onPressed: () {
                  setState(() {
                    currentTab = 1;
                  });
                },
                child: Icon(Icons.favorite,
                    color: currentTab == 1 ? primaryColor : Colors.grey),
              ),
              Spacer(),
              MaterialButton(
                minWidth: 80,
                onPressed: () {
                  setState(() {
                    currentTab = 2;
                  });
                },
                child: Icon(Icons.add_shopping_cart,
                    color: currentTab == 2 ? primaryColor : Colors.grey),
              ),
              MaterialButton(
                minWidth: 80,
                onPressed: () {
                  setState(() {
                    currentTab = 3;
                  });
                },
                child: Icon(Icons.person,
                    color: currentTab == 3 ? primaryColor : Colors.grey),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.search,
        ),
        backgroundColor: primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class MovingItems extends StatelessWidget {
  @required
  int num;
  MovingItems(this.num);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.75),
              blurRadius: 6.0,
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        color: Colors.white,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image(
                image: AssetImage("${images[num]}"),
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 5,
                right: 5,
                bottom: 10,
              ),
              alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "${msg[num]}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                      Text(
                        "5.0 (23 Reviews)",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class header extends StatelessWidget {
  const header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Items",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "View More",
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.purple,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
