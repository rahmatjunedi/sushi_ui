import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restoran_ui/component/button.dart';
import 'package:sushi_restoran_ui/model/food.dart';
import 'package:sushi_restoran_ui/model/shope.dart';
import 'package:sushi_restoran_ui/theme/colors.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
// quantity
  int quantityCount = 0;
// decriment quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

// increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }
// add to cart

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();
      shop.addToCart(widget.food, quantityCount);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                backgroundColor: primaryColor,
                content: Text("Sucsessfuly add to cart",
                    style: TextStyle(color: Colors.white)),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.done_all_outlined))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      body: Column(children: [
        // list view of food detail
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: ListView(
            children: [
              // image
              Image.asset(
                widget.food.imagePath,
                height: 200,
              ),
              SizedBox(
                height: 25,
              ),
              //rating

              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.food.rating,
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              )
              // nama food
              ,
              Text(
                widget.food.name,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              //description
              Text(
                "Description",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Apabila Anda memakan sushi tradisional yang digulung, maka kemungkinan besar yang Anda makan adalah Mak nal sebagai makizushi, jenis sushi ini melibatkan menggulung nasi yang diberi cuka dan berbagai isian rumput laut. Maki memiliki banyak varian. Ada Temaki, yakni sushi dengan aneka isian dan digulung oleh nori dengan bentuk kerucut. Orang-orang menyebutnya Hand Roll Sushi,",
                style: TextStyle(fontSize: 14, height: 3),
              )
            ],
          ),
        ))
        //price + quantyti+add cart detail
        ,
        Container(
          color: primaryColor,
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.food.price,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Row(
                    children: [
                      // minus button
                      Container(
                        decoration: BoxDecoration(
                            color: secondaryColor, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: decrementQuantity,
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                            )),
                      )
                      //angka
                      ,
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Text(
                          quantityCount.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )
                      // plus button
                      ,
                      Container(
                        decoration: BoxDecoration(
                            color: secondaryColor, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: incrementQuantity,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              MyButton(text: "Add To Cart", onTap: addToCart)
            ],
          ),
        )
      ]),
    );
  }
}
