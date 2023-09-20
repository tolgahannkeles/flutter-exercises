import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  late final List<DataModel> _data;

  @override
  void initState() {
    super.initState();

    _data = DataModels().data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return _cardItem(datum: _data[index]);
        },
      ),
    );
  }
}

class _cardItem extends StatelessWidget {
  const _cardItem({
    super.key,
    required DataModel datum,
  }) : _datum = datum;

  final DataModel _datum;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 300,
        child: Column(children: [
          Expanded(child: Image.network(_datum.imageLink)),
          Row(
            children: [
              Text(_datum.name),
              Spacer(),
              Text("${_datum.price}"),
            ],
          ),
        ]),
      ),
    );
  }
}

class DataModels {
  late List<DataModel> data;

  DataModels() {
    data = [
      DataModel(imageLink: "https://picsum.photos/200", name: "Alrmut", price: 35.2),
      DataModel(imageLink: "https://picsum.photos/200", name: "Hakkii Data", price: 21.8),
      DataModel(imageLink: 'https://picsum.photos/200', name: "RAhmuzlar", price: 0.8),
    ];
  }
}

class DataModel {
  final String imageLink;
  final String name;
  final double price;
  DataModel({required this.imageLink, required this.name, required this.price});
}
