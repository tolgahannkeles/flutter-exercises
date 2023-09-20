import 'package:exercise/product/increment_button.dart';
import 'package:flutter/material.dart';

// Statefull widgetlarda setStatte methodu yazıldığı classı tamamen yeniden başlatır
// Bu performansta sıkıntı yaratabilir bu yüzden sadece hayata sahip olan widgetları stateful yap geri kalanı staateless kalsın.
// Dediğimi product/incrementButtonda yaptım.


class Statefull extends StatefulWidget {
  const Statefull({Key? key}) : super(key: key);

  @override
  _StatefullState createState() => _StatefullState();
}

class _StatefullState extends State<Statefull> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(mainAxisSize: MainAxisSize.min, children: [
        increaseButton(),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: decreaseButton(),
        ),
      ]),
      body: Column(
        children: [
          Center(
            child: Text(_count.toString()),
          ),
          const IncrementButton(),
        ],
      ),
    );
  }

  FloatingActionButton increaseButton() {
    return FloatingActionButton(
      onPressed: _increase,
      child: const Icon(Icons.add),
    );
  }

  FloatingActionButton decreaseButton() {
    return FloatingActionButton(
      onPressed: _decrease,
      child: const Icon(Icons.remove),
    );
  }

  void _decrease() {
    setState(() {
      _count--;
    });
  }

  void _increase() {
    setState(() {
      _count++;
    });
  }
}
