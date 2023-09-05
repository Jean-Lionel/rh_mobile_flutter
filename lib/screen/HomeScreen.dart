import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    Widget child = MainPage();
    switch (_index) {
      case 0:
        child = MainPage();
        break;
      case 1:
        child = FlutterLogo(textColor: Colors.orange);
        break;
      case 2:
        child = Center(
          child: Text(
            "Comming soon...",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        );
        break;
    }
    return Scaffold(
      body: SizedBox.expand(child: child),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (newIndex) => setState(() => _index = newIndex),
        currentIndex: _index,
        iconSize: 35,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: "Blue"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: "Orange"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_3), label: "Red"),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text("Archange Ngabirano",
                      style: Theme.of(context).textTheme!.titleLarge),
                  Divider(
                    height: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person_2,
                size: 100,
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        CardDashBoard(),
        SizedBox(
          height: 20,
        ),
        ArriveButton(),
      ]),
    );
  }
}

class ArriveButton extends StatelessWidget {
  const ArriveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          print("Tu viens d'arriver sur l'entreprise");

          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    content: Text('Ok Vous etes dejariver'),
                  ));
        },
        child: Center(
          child: CircleAvatar(
            radius: 120,
            child: Icon(Icons.roofing_rounded, size: 120),
          ),
        ),
      ),
    );
  }
}

class CardDashBoard extends StatelessWidget {
  const CardDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Colors.blue,
            Colors.black,
            Colors.purple,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            trailing: Text(
              'Date',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            leading: Text(
              'Bonjour',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            title: Center(
              child: Text(
                '2023-09-01',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationBarComponent extends StatefulWidget {
  NavigationBarComponent(this._currentNavigation, {super.key});

  final VoidCallback _currentNavigation;
  @override
  State<NavigationBarComponent> createState() => _NavigationBarComponentState();
}

class _NavigationBarComponentState extends State<NavigationBarComponent> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Widget child = FlutterLogo();
    switch (index) {
      case 0:
        child = FlutterLogo();
        break;
      case 1:
        child = FlutterLogo(
          textColor: Colors.black12,
        );
        break;
      case 2:
        child = FlutterLogo(textColor: Colors.red);
        break;
    }
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int index) {
        widget._currentNavigation;
        setState(() {
          this.index = index;
        });
      },
      // Colors.black,
      backgroundColor: Color.fromARGB(255, 97, 111, 122),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.alarm,
            size: 30,
            color: Colors.white,
          ),
          label: 'A',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          label: 'B',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history,
            size: 30,
            color: Colors.white,
          ),
          label: 'C',
        ),
      ],
    );
  }
}
