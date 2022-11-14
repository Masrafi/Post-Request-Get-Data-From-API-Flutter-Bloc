import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewData extends StatefulWidget {
  List userdata;

  ViewData({Key? key, required this.userdata}) : super(key: key);

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  @override
  Widget build(BuildContext context) {
    List data = widget.userdata;
    return Scaffold(
      appBar: AppBar(
        title: Text("View Data"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, index) {
          return Card(
            color: Colors.blue,
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListTile(
              title: Text(
                data[index].tendersource,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                data[index].workdesc,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
