import 'package:flutter/material.dart';
import 'package:foodapp/data/data.dart';
import 'package:foodapp/models/restaurant.dart';
import 'package:foodapp/screens/restaurant_screen.dart';
import 'package:foodapp/widgets/ratting_starts.dart';
import 'package:foodapp/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  _buildRestaurants() {
      List<Widget> restaurantList = [];
      restaurants.forEach((Restaurant restaurant) {
          restaurantList.add(
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RestaurantScreen(restaurant: restaurant)
                  ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey.shade200
                  )
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Hero(
                        tag: restaurant.imageUrl,
                        child: Image(
                          image: AssetImage(restaurant.imageUrl),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            restaurant.name,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4.0,),
                          RattingStart(restaurant.rating),
                          SizedBox(height: 4.0,),
                          Text(
                            restaurant.address,
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 4.0,),
                          Text(
                            '0.2 million',
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          );
      });
      return Column(
        children: restaurantList,
      );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: () {
          },
        ),
        title: Text('Food delivery App'),
        actions: <Widget> [
          FlatButton(
            child: Text(
              'Cart (${currentUser.cart.length})',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0)
                ),
                hintText: 'Search for food',
                prefixIcon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {}
                )
              ),
            ),
          ),
          RecentOrder(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Restaurants',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2
                  ),
                ),
              ),
              _buildRestaurants()
            ],
          )
        ],
      ),
    );
  }
}

