import 'package:flutter/material.dart';
import 'package:moveset/core/constants/app_colors.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tudo bom?'),
        ),

        body: ListTile(
          title: Text('Produto 1'),
          subtitle: Text('Sub titulo'),
          leading: Container(
            width: 50,
            color: AppColors.mainShowCaseBlue,
          ),
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(234, 74, 145, 226),
          onPressed: () => {print("Oi")},
          elevation: 15.0,
          child: Icon(Icons.add),
        ),

      )
    );
  }
}