import 'package:flutter/material.dart';
import 'package:foodgo_project/DataBase.dart';
import 'package:foodgo_project/thirdpage.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "FoodGo",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/avathar.jpeg"),
                ),
              ],
            ),

            Row(
              children: [
                Text(
                  "Order your favourite Food!",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, size: 40),
                      Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(Icons.menu, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 50,

              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10);
                },
                scrollDirection: Axis.horizontal,
                itemCount: Database.FoodDetails.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 15,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Database.FoodDetails[index]["container_color"],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(Database.FoodDetails[index]["name"]),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 35),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                ),
                itemCount: Database.FoodImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ThirdPage(
                                    image: Database.FoodImages[index]["image"],
                                    name: Database.FoodImages[index]["name"],
                                    price: Database.FoodImages[index]["price"],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    Database.FoodImages[index]["image"],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              Database.FoodImages[index]["name"],
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              Database.FoodImages[index]["subname"],
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, size: 23, color: Colors.yellow),
                            Text(
                              Database.FoodImages[index]["rating"],
                              style: TextStyle(color: Colors.black),
                            ),
                            Spacer(),
                            Icon(Icons.favorite_border, color: Colors.black),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "chat"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "favorite",
          ),
        ],
      ),
    );
  }
}
