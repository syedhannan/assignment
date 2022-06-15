import 'package:flutter/material.dart';

import 'models/items.dart';

class MyList extends StatefulWidget {
  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  static bool isDescending = false;
  bool islth = true; //low to high
  bool ishtl = false; //high to low

  List<Items> elements = [
    Items(
        name: "Tezos",
        symbol: "XTZ",
        url: "assets/tezos.png",
        amount: 204.53,
        value: 34),
    Items(
        name: "Dogami",
        symbol: "Dogo",
        url: "assets/dogami.png",
        amount: 21.90,
        value: 0.431),
    Items(
        name: "GIF",
        symbol: "Gif",
        url: "assets/gif.png",
        amount: 473.21,
        value: 2),
    Items(
        name: "Abcd",
        symbol: "ABCD",
        url: "assets/tezos.png",
        amount: 600.12,
        value: 102),
    Items(
        name: "Xyz",
        symbol: "XYZ",
        url: "assets/dogami.png",
        amount: 1003.53,
        value: 0.61),
    Items(
        name: "Lmn",
        symbol: "LMN",
        url: "assets/gif.png",
        amount: 24.53,
        value: 23),
    Items(
        name: "Xyz",
        symbol: "XYZ",
        url: "assets/dogami.png",
        amount: 512.53,
        value: 54.2),
    Items(
        name: "Xyz",
        symbol: "XYZ",
        url: "assets/dogami.png",
        amount: 313.53,
        value: 6.36),
  ];

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else
        return color;
    };
    return MaterialStateProperty.resolveWith(getColor);
  }

  void sortModalsheet() {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          return Container(
            height: 200,
            // color: Colors.amber,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Sort By",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Done",
                            style:
                                TextStyle(fontSize: 18, color: Colors.yellow),
                          )),
                    )
                  ],
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  indent: 25,
                  endIndent: 25,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor: getColor(Colors.black, Colors.black),
                          backgroundColor: islth == true
                              ? getColor(Colors.yellow, Colors.white)
                              : getColor(Colors.grey, Colors.transparent)
                          // overlayColor: getColor(Colors.white, Colors.yellow),
                          ),
                      onPressed: () {
                        setModalState(() {
                          if (islth == true) {
                            Navigator.of(context).pop();
                          } else {
                            islth = !islth;
                            ishtl = false;
                            setState(() {
                              isDescending = false;
                            });

                            Navigator.of(context).pop();
                          }
                        });
                      },
                      child: Text(
                        "Price: Lowest to highest",
                        style: TextStyle(
                            color: islth == true ? Colors.black : Colors.white),
                      )),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: getColor(Colors.black, Colors.black),
                        backgroundColor: ishtl == true
                            ? getColor(Colors.yellow, Colors.white)
                            : getColor(Colors.grey, Colors.transparent),
                        // overlayColor: getColor(Colors.white, Colors.yellow),
                      ),
                      onPressed: () {
                        setModalState(() {
                          if (ishtl == true) {
                            Navigator.of(context).pop();
                          } else {
                            ishtl = !ishtl;
                            islth = false;

                            setState(() {
                              isDescending = true;
                            });
                            Navigator.of(context).pop();
                          }
                        });
                      },
                      child: Text(
                        "Price: Highest to lowest",
                        style: TextStyle(
                            color: ishtl == true ? Colors.black : Colors.white),
                      )),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "All Tokens",
                style: TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () {
                  sortModalsheet();
                },
                child: Row(
                  children: [
                    Transform.rotate(
                      angle: 90 * 3.14 / 180,
                      child: Icon(
                        Icons.compare_arrows,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Sort By",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
              )
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: elements.length,
            physics: ScrollPhysics(),
            itemBuilder: (ctx, index) {
              final sortedItems = elements
                ..sort((item1, item2) => isDescending
                    ? item2.amount.compareTo(item1.amount)
                    : item1.amount.compareTo(item2.amount));
              final item = sortedItems[index];
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 14, right: 30, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "${item.url}",
                                height: 20,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${item.name}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text("${item.symbol}"),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${item.value}",
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 17),
                              ),
                              Text("\$${item.amount}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      indent: 25,
                      endIndent: 25,
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}
