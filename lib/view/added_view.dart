import 'package:counter_app/view/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Added extends StatelessWidget {
  const Added({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewState homeView = HomeViewState();
    return Scaffold(appBar: AppBar(),
      body: Center(child: ListView.builder(
        itemCount: added.length,
        itemBuilder: (context,index) {
          return Container(
            height: 50,decoration:BoxDecoration(image:DecorationImage(image: added[index]) )
           );
        }
      )),);
  }
}