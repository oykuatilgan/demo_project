import 'package:flutter/material.dart';
import 'package:flutter_demo_project/demo_app/coin_page.dart';
import 'package:flutter_demo_project/demo_app/themes/themes.dart';

//flutter run --web-renderer html
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oyku Coin App',
      theme: isDarkMode ? darkTheme : lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('cyripto application first page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Card(
                  child: ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CoinPage(
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  );
                },
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      'show coin values',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )),
            ),
            _BottomSheetWidget(),
            _changeThemeMethod(context)
          ],
        ),
      ),
    );
  }

  Expanded _changeThemeMethod(BuildContext context) {
    return Expanded(
      child: Card(
        child: ListTile(
          onTap: () {
            toggleTheme();
            Scaffold.of(context).setState(() {});
          },
          title: Center(child: Text('change mode')),
          subtitle: Center(child: Text('light/dark')),
          trailing: isDarkMode
              ? Icon(Icons.wb_sunny_outlined)
              : Icon(Icons.dark_mode_outlined),
        ),
      ),
    );
  }
}

class _BottomSheetWidget extends StatelessWidget {
  const _BottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: ListTile(
          onTap: () {
            showModalBottomSheet(
                isDismissible: false,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox.square(
                      dimension: 350,
                      child: Row(
                        children: [
                          Text(
                            'SHOW MODAL BOTTOM SHEET',
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context); //bak
                                print('sheet closed');
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('sheet closed'),
                                  duration: Duration(seconds: 5),
                                  showCloseIcon: true,
                                  closeIconColor: Colors.red,
                                ));
                              },
                              icon: const Icon(Icons.close))
                        ],
                      ),
                    ),
                  );
                },
                barrierColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50))));
          },
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Text(
                'show snackbar',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
