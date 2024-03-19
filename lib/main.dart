import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(useMaterial3: false,
      textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white)),
      home: Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade500,
          title: const Text('Material App Bar'),
        ),
        body: const Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool bottom = false;
  bool shape = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width,
        height: 600,
        color: Colors.grey.shade400,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    shape = !shape;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.bounceInOut,
                  width: 100,
                  height: 100,
                  decoration: ShapeDecoration(
                       color: Colors.blue,
                      shape: shape
                          ? const CircleBorder()
                          : const RoundedRectangleBorder()),
                  child: const Center(child: Text('SoeThuHtun', style: TextStyle(color: Colors.white),),),
                ),
              ),
              Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedPositioned(
                       bottom: bottom ? 340 : 180,
                      duration: const Duration(seconds: 1),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            bottom = !bottom;
                          });
                        },
                        child: Container(
                          width: 200,
                          height: 200,
                          color: Colors.green,
                          child: Stack(
                            children: [
                              AnimatedPadding(
                                duration: const Duration(seconds: 2),
                                padding: bottom
                                    ? const EdgeInsets.only(top: 1)
                                    : const EdgeInsets.all(8.0),
                                child: AnimatedAlign(
                                  alignment: bottom
                                      ? Alignment.center
                                      : Alignment.bottomLeft,
                                  duration: const Duration(seconds: 2),
                                  child: AnimatedDefaultTextStyle(
                                    duration: const Duration(seconds: 2),
                                    style: bottom? const TextStyle(fontSize: 18, color: Colors.deepPurple) : const TextStyle(fontSize: 16, color: Colors.white),
                                    child: const Text('Animation')),
                                ),
                              ),
                              AnimatedPadding(
                                duration: const Duration(seconds: 2),
                                padding: bottom
                                    ? const EdgeInsets.only(top: 40)
                                    : const EdgeInsets.all(8.0),
                                child: AnimatedAlign(
                                  alignment: bottom
                                      ? Alignment.center
                                      : Alignment.bottomRight,
                                  duration: const Duration(seconds: 2),
                                  child: const Text('Lessons'),
                                ),
                              ),
                              AnimatedAlign(
                                alignment: bottom
                                    ? Alignment.bottomCenter
                                    : Alignment.center,
                                duration: const Duration(seconds: 2),
                                child: const Text('Flutter Batch-9'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
