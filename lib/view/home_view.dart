import 'package:counter_app/view/added_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

Widget returntobuild(BuildContext context,
    {required Function() onPressed,
    Function()? onDoubleTap,
    required AssetImage image,
    Color? color}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      child: GestureDetector(
        onDoubleTap: onDoubleTap,
        child: Container(
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(image: image, fit: BoxFit.contain)),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(Icons.favorite_outline, color: color),
                ),
              ),
            )),
      ),
    ),
  );
}

List images = const [
  AssetImage('images/aby1.png'),
  AssetImage('images/cd.png'),
  AssetImage('images/cd1.png'),
  AssetImage('images/images.png'),
  AssetImage('images/pra1.jpg'),
];
List<bool> getIndex = [false,false,false,false,false,];
  List added = [];


class HomeViewState extends State<HomeView> {
  bool colored = false;


  @override
  Widget build(BuildContext context) {
    ClickAction clickAction = ClickAction();
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Add to favorite')),
      body: ValueListenableBuilder(
          valueListenable: clickAction,
          builder: (context, value, child) {
            return ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return returntobuild(context,
                      onDoubleTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const Added())),
                      color: getIndex[index] == colored ? Colors.red : Colors.grey,
                      image: images[index],
                      onPressed: () {
                        added.add( images[index]);
                        print(images[index]);
                        setState(() {
                          getIndex[index] = !colored;
                          // colored = !colored;
                        });
                      });
                });
          }),
    );
  }
}

class ClickAction extends ValueNotifier {
  HomeViewState state = HomeViewState();
  ClickAction() : super(['hello']);

  void add() {
    added.add(value);
  }
}
