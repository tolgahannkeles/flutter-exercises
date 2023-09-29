import 'package:exercise/202/context_extension.dart';
import 'package:flutter/material.dart';

class AnimatedExercise extends StatefulWidget {
  const AnimatedExercise({super.key});

  @override
  State<AnimatedExercise> createState() => _AnimatedExerciseState();
}

class _AnimatedExerciseState extends State<AnimatedExercise>
    with TickerProviderStateMixin {
  bool _isVisible = false;
  bool _isOpac = true;
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  void _changeVisibilty() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpac = !_isOpac;
    });
  }

  // ,
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisibilty();
          _changeAnimatedIconState();
        },
      ),
      body: Column(children: [
        ListTile(
          title: _animatedOpacity(),
          trailing: IconButton(
            onPressed: () {
              _changeOpacity();
            },
            icon: Icon(Icons.dark_mode_outlined),
          ),
        ),
        _animatedTextStyle(),
        _animatedIcon(),
        _animatedContainer(),
        Expanded(child: _animatedPosition()),
        Expanded(child: _animatedList()),
      ]),
    );
  }

  Widget _animatedCrossFade() {
    return AnimatedCrossFade(
      firstChild: Placeholder(),
      secondChild: Container(color: Colors.amber),
      duration: Duration(seconds: 2),
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  Widget _animatedOpacity() {
    return AnimatedOpacity(
      opacity: _isOpac ? 1 : 0.2,
      duration: Duration(seconds: 2),
      child: Text(
        "text",
        style: context.textTheme().headlineLarge,
      ),
    );
  }

  Widget _animatedTextStyle() {
    return AnimatedDefaultTextStyle(
        child: Text("Text text"),
        style: (_isVisible
                ? context.textTheme().headlineLarge
                : context.textTheme().bodyLarge) ??
            TextStyle(),
        duration: Duration(seconds: 1));
  }

  Widget _animatedIcon() {
    return AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _animationController);
  }

  void _changeAnimatedIconState() {
    _animationController.animateTo(_isVisible ? 1 : 0, duration: Duration(seconds: 1));
  }

  Widget _animatedContainer() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: _isVisible ? MediaQuery.of(context).size.height * .2 : 100,
      width: MediaQuery.of(context).size.width * .2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(_isVisible ? 20 : 0)),
          color: Colors.amber),
    );
  }

  Widget _animatedList() {
    return AnimatedList(
      initialItemCount: 4,
      itemBuilder: (context, index, animation) {
        return Text("data");
      },
    );
  }

  Widget _animatedPosition() {
    return Stack(
      children: [
        AnimatedPositioned(
          child: Container(
            height: 30,
            width: 100,
            color: Colors.pink,
          ),
          duration: Duration(seconds: 1),
          left: _isVisible ? 40 : 0,
        )
      ],
    );
  }
}
