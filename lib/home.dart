import 'package:flutter/material.dart';
import 'package:sample/constants/sizing.dart';
import 'package:sample/widgets/empty_space.dart';
import 'package:sample/widgets/scroll_to_hide_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: _bottomNavigationBar(),
        body: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              color: Colors.white,
              child: Column(children: [
                Text('Heading'),
                const SizedBox(height: kDefaultPadding),
                Container(
                  color: Colors.pinkAccent,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Hi there'),
                      );
                    },
                  ),
                ),
                Container(
                  color: Colors.amber,
                  height: 250,
                  child: Text('Second Section'),
                ),
                // SizedBox(height: 160),
                EmptySpace(),
              ]),
            )),
      ),
    );
  }

  _bottomNavigationBar() {
    return ScrollToHideWidget(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.all(Radius.circular(kDefaultBorderRadius - 10))),
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.home),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.grid_view_rounded),
                  color: Colors.black,
                ),
                const SizedBox(width: 30),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
