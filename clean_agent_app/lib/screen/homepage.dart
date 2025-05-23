import 'package:clean_agent_app/widget/sidebar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        leading: Builder(
          builder: (context) {
            return IconButton(onPressed: (){
              Scaffold.of(context).openDrawer();
            },
              icon:const Icon(Icons.menu),color: Colors.white,);
          }
        ),
      ),
      drawer: const SideBar(),
      body: Text("I love man ue"),

    );
  }
}
