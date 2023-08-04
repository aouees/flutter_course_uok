import 'package:flutter/material.dart';
import '/w2/calc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Screeen"),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(500))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             UserAccountsDrawerHeader(
              accountName: const Text("1.0.0"),
             accountEmail: const Text("Calculator"),
             currentAccountPicture:Container(color: Colors.white,child: Image.asset('2.png', height: 120),),
             ),
            const ListTile(
              title: Text("tap on the unit you want to start calculator"),
              leading: Icon(Icons.analytics_outlined),
              textColor: Colors.white,
              iconColor: Colors.white,
            ),
            ListTile(
              title: const Text(
                "centiemeter",
                textAlign: TextAlign.center,
              ),
              textColor: Colors.white,
              iconColor: Colors.white,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Calculator(unit: "CM"),
                ));
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              title: const Text(
                "meter",
                textAlign: TextAlign.center,
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              textColor: Colors.white,
              iconColor: Colors.white,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Calculator(unit: "M"),
                ));
              },
            ),
            ListTile(
              title: const Text(
                "kilometer",
                textAlign: TextAlign.center,
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              textColor: Colors.white,
              iconColor: Colors.white,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Calculator(unit: "KM"),
                ));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [     
                CircleAvatar(
                  radius: 80.0,
                  backgroundColor:  Theme.of(context).colorScheme.primary,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 76.0,
                    child: Image.asset('1.png', height: 120),
                  ),
                ),
                CircleAvatar(
                 radius: 80.0,
                 backgroundColor: Colors.orange[400],
                 child: CircleAvatar(
                   backgroundColor: Colors.white,
                   radius: 76.0,
                   child: Image.asset('2.png', height: 120),
                 ),
               ),
              ],
            ),
            const Text(
              "Owis Alhammoud",
              style: TextStyle(fontSize: 30),
            ),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text("aouees@gamil.com"),
              contentPadding: EdgeInsets.all(10.0),
            ),
            const ListTile(
              leading: Icon(Icons.usb_outlined),
              title: Text("201811330"),
              contentPadding: EdgeInsets.all(10.0),
            ),
            const ListTile(
              leading: Icon(Icons.account_balance_outlined),
              title: Text("University of kalamoon"),
              contentPadding: EdgeInsets.all(10.0),
            ),
            const ListTile(
              leading: Icon(Icons.stars_outlined),
              title: Text("Information technology Engineering"),
              contentPadding: EdgeInsets.all(10.0),
            ),
          ],
        ),
      ),
    );
  }
}
