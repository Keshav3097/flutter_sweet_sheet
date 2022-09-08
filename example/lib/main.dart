import 'package:flutter/material.dart';
import 'package:flutter_sweet_sheet/flutter_sweet_sheet.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SweetSheet',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        useMaterial3: true
      ),
      home: HomePage(title: 'SweetSheet'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  HomePage({required this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SweetSheet _sweetSheet = SweetSheet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            LargeButton(
              context: context,
              text: 'Success sheet',
              onClick: () {
                _sweetSheet.show(
                  context: context,
                  title: const Text("Lorem Ipsum"),
                  description: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. no you condimentum finibus ut ut lorem. Ut pellentesque mauris ut arcu rutrum, at tincidunt arcu tincidunt"),
                  color: SweetSheetColor.success,
                  positive: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CANCEL',
                  ),
                );
              },
            ),
            LargeButton(
              context: context,
              text: 'Danger sheet with icon not dismissible',
              onClick: () {
                _sweetSheet.show(
                  isDismissible: false,
                  context: context,
                  title: const Text("Delete this post?"),
                  description:
                  const Text("This action will permanently delete this post."),
                  color: SweetSheetColor.danger,
                  icon: Icons.delete,
                  positive: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'DELETE',
                  ),
                  negative: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CANCEL',
                  ),
                );
              },
            ),
            LargeButton(
              context: context,
              text: 'Warning sheet with icon',
              onClick: () {
                _sweetSheet.show(
                  context: context,
                  title: const Text("Attention"),
                  description: const Text(
                      'Your app is not connected to internet actually, please turn on Wifi/Celullar data.'),
                  color: SweetSheetColor.warning,
                  icon: Icons.portable_wifi_off,
                  positive: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'OPEN SETTING',
                    icon: Icons.open_in_new,
                  ),
                  negative: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CANCEL',
                  ),
                );
              },
            ),
            LargeButton(
              context: context,
              text: "Nice sheet with icon",
              onClick: () {
                _sweetSheet.show(
                  context: context,
                  title: const Text("Connect your watch"),
                  description: const Text(
                      'To import your health data, you have to connect your smartwatch fist.'),
                  color: SweetSheetColor.nice,
                  icon: Icons.watch,
                  positive: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CONNECT',
                    icon: Icons.open_in_new,
                  ),
                  negative: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CANCEL',
                  ),
                );
              },
            ),
            LargeButton(
              context: context,
              text: "Sheet with custom dark color",
              onClick: () {
                _sweetSheet.show(
                  context: context,
                  title: const Text("Welcome back"),
                  description: const Text(
                      'We are happy to see you again. We have some new things for you.'),
                  color: CustomSheetColor(
                    mainColor: Colors.black12,
                    accentColor: Colors.black87,
                    iconColor: Colors.white,
                  ),
                  icon: Icons.bubble_chart,
                  positive: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'LET\'S GO',
                  ),
                );
              },
            ),
            LargeButton(
              context: context,
              text: "Sheet with custom light color",
              onClick: () {
                _sweetSheet.show(
                  context: context,
                  description: const Text(
                    'Place your order. Please confirm the placement of your order : Iphone X 128GB',
                    style: TextStyle(color: Color(0xff2D3748)),
                  ),
                  color: CustomSheetColor(
                    mainColor: Colors.white,
                    accentColor: const Color(0xff5A67D8),
                    iconColor: const Color(0xff5A67D8),
                  ),
                  icon: Icons.local_shipping,
                  positive: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CONTINUE',
                  ),
                  negative: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CANCEL',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LargeButton extends StatelessWidget {
  final BuildContext context;
  final String text;
  final VoidCallback onClick;

  const LargeButton({
    Key? key,
    required this.context,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          padding: const EdgeInsets.all(30),
          color: Colors.black45,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}