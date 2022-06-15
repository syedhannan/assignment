import 'dart:math';

import 'package:flutter/material.dart';

import 'cards.dart';
import 'my_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map> _products = List.generate(30, (i) {
    return {"id": i, "name": "Product $i", "price": Random().nextInt(200) + 1};
  });

  int _currentSortColumn = 0;
  bool _isAscending = true;

  void comingSoon() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Coming Soon'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void sendComingSoon() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Send/Receive tokens from anyone'),
        content: Text("Coming Soon"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void accountModalsheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          // color: Colors.amber,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.people,
                        color: Colors.purple[200],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Accounts',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.purple[200]),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 1,
                thickness: 1,
                indent: 25,
                endIndent: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            "John Doe",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1,
                thickness: 1,
                indent: 25,
                endIndent: 25,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (() {
                  comingSoon();
                }),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.purple[200],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Account",
                          style: TextStyle(
                              fontSize: 18, color: Colors.purple[200]),
                        ),
                        Text(
                          "Create or import a new account",
                          style: TextStyle(
                              fontSize: 16, color: Colors.purple[200]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
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
              GestureDetector(
                onTap: (() {
                  comingSoon();
                }),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.download,
                      color: Colors.purple[200],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Import Gallery",
                          style: TextStyle(
                              fontSize: 18, color: Colors.purple[200]),
                        ),
                        Text(
                          "Add any Gallery, even of others",
                          style: TextStyle(
                              fontSize: 16, color: Colors.purple[200]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: double.infinity,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Portfolio Balance"),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "\$46.78",
                                      style: TextStyle(
                                          color: Colors.yellow, fontSize: 18),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    accountModalsheet();
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.account_box_outlined,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        "John Doe",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black,
                                        // size: 20,
                                      ),
                                    ],
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.yellow),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ))),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        IconButton(
                                            splashRadius: 20,
                                            iconSize: 40,
                                            onPressed: () {
                                              sendComingSoon();
                                            },
                                            icon: Icon(Icons.arrow_circle_up)),
                                        Text("Send")
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                            splashRadius: 20,
                                            iconSize: 40,
                                            onPressed: () {
                                              sendComingSoon();
                                            },
                                            icon:
                                                Icon(Icons.arrow_circle_down)),
                                        Text("Receive")
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                        splashRadius: 20,
                                        iconSize: 40,
                                        onPressed: () {
                                          sendComingSoon();
                                        },
                                        icon: Icon(
                                            Icons.qr_code_scanner_outlined)),
                                    Text("Scan")
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                ),
                CardsDismiss(),
                MyList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
