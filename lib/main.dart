import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

List<String> names = ['Товары для Пушъ', "Зелёный чай", "Умный дом"]; // , "Умный дом", "Техника VINASTRO", "APS"];
var products = [
  [["Пистолет П-123", "1000 BDP Un", "https://kazan.mens-tema.ru/wa-data/public/shop/products/74/02/274/images/2395/2395.750x0.jpg"], ["Зубы вставные - 2 шт.", "2000 BDP Un", "https://kot-pes.com/wp-content/uploads/2019/03/post_5b80fe5d2a734.jpg"]],
  [["Зелёный чай Oromy's Tea - 300 кг", "250 BDP Un", "https://podacha-blud.com/uploads/posts/2022-10/1665293914_1-podacha-blud-com-p-chainik-zelenii-chai-foto-1.jpg"]],
  [["Vinastro Tower Control", "100000000 BDP Un", "https://cdn.tripster.ru/thumbs2/cfbfcc66-e5c1-11e9-b046-025c4c6e7a28.800x600.jpg"]],
];
var Card = [

];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliveryAll',
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellow,
            brightness: Brightness.light,
        ),

        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
            //color: Colors.white,
          ),
        ),
      ),

      home: Scaffold(
        appBar: AppBar(
          title: const Text('DeliveryAll', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: const Icon(Icons.person_outline, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),

        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),

              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {},
              ),

              IconButton(
                icon: const Icon(Icons.monetization_on),
                onPressed: () {},
              ),
            ],
          )
        ),

        body: Body(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //const Padding(padding: EdgeInsets.all(15)),
            SearchBlock(),
            const  Padding(padding: EdgeInsets.all(25)),
            HomeBlock(),
          ],
    )));
  }
}

class SearchBlock extends StatefulWidget {
  const SearchBlock({super.key});

  @override
  _SearchBlockState createState() => _SearchBlockState();
}

class _SearchBlockState extends State<SearchBlock> {
  late TextEditingController _controller;
  @override

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              //border: OutlineInputBorder(),
              hintText: 'Search',
            ),

            controller: _controller,
          ),
        ),

        OutlinedButton(
            onPressed: () {},
            child: const Icon(Icons.search),
        ),
      ],
    );
  }
}

class HomeBlock extends StatelessWidget {
  int i = 0;

  HomeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (i = 0; i < names.length; i++)
            Column(children: <Widget>[
              const Padding(padding: EdgeInsets.all(5)),

              Container(
                alignment: Alignment.topLeft,

                child: Text(names[i], style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
              ),

              const Padding(padding: EdgeInsets.all(5)),
                SingleChildScrollView( scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[

                      for (var list in products[i])
                        Column(children: <Widget>[
                          Product(
                            name: list[0],
                            cost: list[1],
                            uri: list[2],
                          ),
                        ]),


                    ],
                )),
                ]),
              ]),
    );
  }
}

class Product extends StatelessWidget {
  final String name;
  final String cost;
  final String uri;


  Product({
    super.key,
    required this.name,
    required this.cost,
    required this.uri
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black, width: 1),
          ),

          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),

          child: Column(
            children: <Widget>[
              Image.network(uri, height: 100, width: 100),
              Text(name, style: const TextStyle(fontSize: 20)),
              Text(cost, style: const TextStyle(fontSize: 15, color: Colors.red)),
            ],
          ),
        ),

      onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Product_Card(name: name, cost: cost, uri: uri)));
      },
    );
  }
}

class Product_Card extends StatelessWidget {
  final String name;
  final String cost;
  final String uri;

  const Product_Card({
    super.key,
    required this.name,
    required this.cost,
    required this.uri
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliveryAll', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      body: Container(
        color: Colors.white,

        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(15)),

            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black, width: 1),
              ),

              child: Image.network(uri, height: 400, width: 400),
            ),

            const Padding(padding: EdgeInsets.all(15)),

            Text(name, style: const TextStyle(fontSize: 40, color: Colors.black,)),
            Text(cost, style: const TextStyle(fontSize: 15, color: Colors.red)),

            const Padding(padding: EdgeInsets.all(15)),

            Container(
              width: 400,
              height: 50,
              color: Colors.yellow,

              child: TextButton(
                child: const Text("В карзину!", style: const TextStyle(fontSize: 20)),
                onPressed: () {
                  Card.insert(Card.length, [name, cost, uri]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginFile();
  }

  void checkLoginFile() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/login.txt');
    if (await file.exists()) {
      setState(() {
        isLoggedIn = true;
      });
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? Home() : Login();
  }
}