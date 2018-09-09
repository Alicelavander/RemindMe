import 'package:flutter/material.dart';
import 'package:googleapis/sheets/v4.dart' as googleapis;
import 'package:googleapis_auth/auth_io.dart' as googleapis;
import 'package:location/location.dart';
import 'package:thisisatest/fancy_fab.dart';
import 'package:thisisatest/second_screens.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

final credentials = new googleapis.ServiceAccountCredentials.fromJson(r'''
{
  "type": "service_account",
  "project_id": "study-project-208605",
  "private_key_id": "1b81c600ddb4dcc6a4755b65b21ba3502e1a4fd6",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDDCaaDDbqTiR8R\nbQy1SQklx9tSRr4Xg01HTSBF4JjefZ0CzBwJ2xblrWaiSL1+qFzxkmDgjpjjDw4S\nhCHViEidf9so5Vv91FFr0+IuN8VbBegJf97A/0nQPXqCvJGLyxyxJlYDZWJ8lAtb\ngKhcO00FG4uFgrSRD9DQZIrOyk0D5aQ1t1xme3htej/Qg7EBzqKOtriKBlKKbTg1\nVl2cPJqGbYGyPg87OWpumEndWmVIJCpUjGzLXPqAyh6rCkupaHZ+CXfihzpWySW9\n7yPQF0zoLzG8pS2VrKhUsIjiNkEYoqaPryXAq1VWdFr6BuXYmvWh9VH7yD+T6uVO\n6N0MZHkpAgMBAAECggEAQjekD2mZV17eK/Hstx3hW7DjjycSgfQjyBnw45iR/jQC\nm0EGIfh+6SK6rk1o/LgXujK67nKriKeDXRj8Tb2T/dk7ZMKePWsY67WH3K41tKYo\nNhVyYO8rteYxknKILcCbcK+10zhYPDidNIdVYd8GUr4b3AvY10lZ2W7RS80WYcQ9\ng3XrRzRg4nb0SEkdfgP6CxY0SWhQUuvxv8WqO/T9U5Fh5yS/+ciaC5xg03SAGwbw\nzVvFMfZFb5L0pDgOCLkgi3VCYgHjRYoVUPcOiAevPc6w8jFF6uu28QIBexLSvyiP\nnzfH7PBSZY9F3a5zed23roCG5v/AsjdpW6blo/oUMwKBgQDiC/X3LRTd9i14doM1\nUaNPvigh1q7Cm7tJ1Ns2MG6qk9kv1AESYk2pN6SnvZ25938jbYMlut9AaP5VChuA\nZsgbHltDBoIg+vo/luNNG5HFZrYFm9+0KuZcZwzeLMAvpXKIprS1VSM5fDtbBlr4\nYmu/6ZfAz8ngu95hDGSjnj71bwKBgQDc4cpKxCdUITrs4RlX0ZY/dMgZg+SNT+3z\n4TQ6qBtyFYNTo7+9LSItU/yBMRm/MiqZs6EkWCWaUSJeZBQkqksoGtoYcxxmY0nR\ndab+h6vVUoVOv70IqY7NVQ5Mc0RylwSSUudK5gbBhPu2LJuj0t6OhZKbnlCaUMSD\n5wXf904e5wKBgQDT2LnPySRBUTIUL52QHs6bMW+TJwvpvuGrtB0tj/5nRuDI/jty\n60Y1TLy3p/FmFBnHLh83AQex6bRSJoLXt3vaTnzhN/xExHI7nkGwRiI7iqMUZp0k\n0P/LoZhhsDb9cGUCxJmfSAcXHOLT0AT5u+OXnGhof1SHlgo3kdHPtcLzaQKBgBFt\nk1uQ3JWLxa15GVnPhK5fFYbF3Fu2Cc1rYIacSwYWYnVP/0n67K5s6Qh8ik6Gs8vK\n25UVi2oAqtiNxvUZprJ0Y+737i65+NIZGWMN62X6i+Apys2LK2RSKL2pfqYX+lld\nRzimq7PLPV0jaehkNAFE0suKk0uJweeya8k/Jx/TAoGBANbIhL5SqauD9GiL55Bg\nUz+KnMSK2r3g3bb2B2eq93HZ6osGMHHJ5E4RbrZV918NysG1rQtJpm8Ui5oHC9+2\nB/1GFr/NzPnmBzMrzSdweFuXJUl0jERPlRKXiU+Zkci8SIvWbbB95ZXGkoBg6WWe\nnAZSDXHiJuNxok0hk9LGW3eg\n-----END PRIVATE KEY-----\n",
  "client_email": "testest@study-project-208605.iam.gserviceaccount.com",
  "client_id": "103102275752267119758",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://accounts.google.com/o/oauth2/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/testest%40study-project-208605.iam.gserviceaccount.com"
 }
 ''');
const SCOPES = const [googleapis.SheetsApi.SpreadsheetsScope];

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  String payload;
  BuildContext context;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  MyApp(){
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
      new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings, selectNotification: onSelectNotification);
  }

  Future onSelectNotification(String Payload) async{
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new MyApp()),
    );
  }

  void showNotification() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'Reminder', 'You have something to do!', platformChannelSpecifics,
        payload: 'item id 2');
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return new MaterialApp(
      title: 'To Do List',
      theme: new ThemeData(
        primaryColor: new Color(0xFFC8E6C9),
      ),
      home: new RandomWords(this),
    );
  }
}

class RandomWords extends StatefulWidget {
  MyApp app;
  //final Function() onPressed;
  //final String tooltip;
  //final IconData icon;

  RandomWords(MyApp app) {
    this.app = app;
  }

  @override
  RandomWordsState createState() {
    return new RandomWordsState(app);
  }
}

class RandomWordsState extends State<RandomWords> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 25.0);
  List<List<Object>> values;
  String lastPlace;
  CurrentLocation current = new CurrentLocation();
  List<String> arrays = ['loading...'];

  MyApp app;

  RandomWordsState(MyApp app) {
    this.app = app;

    new Timer.periodic(new Duration(minutes: 2), (timer) {
      print("lol");

      if (values == null)
        action();
      else {
        selectGPS();
      }
    });
  }

  @override
  void initState() {
    action();
  }

  @override
  Widget build(BuildContext context) {
    //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked;\
    return new Scaffold(
      backgroundColor: new Color(0xFFFFFDE7),
      appBar: new AppBar(title: const Text('To Do List')),
      floatingActionButton: FancyFab(onPressed: addLocation, onTodoPressed: addTodo, onRefresh: action, current: current),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.endFloat,
      body:  new Column(
          children: <Widget>[
              createList(),
          ],
        ),
    );
  }

  Widget createList() {
    return new Expanded(
      child: ListView.builder(
        itemCount: arrays.length,
        itemBuilder: (context, index) {
          return new Card(
            margin: EdgeInsets.all(10.0),
            elevation: 10.0,
            child: Container(
              padding: EdgeInsets.only(top: 5.0),
              child: new Column(
                children: <Widget>[
                  new Text(
                    arrays[index],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      //new IconButton(onPressed: call, icon: new Icon(Icons.call),),
                      new IconButton(onPressed: line, icon: new Icon(Icons.textsms),),
                    ],
                  )
                ],
              ),
            ),
          );
        }
      )
    );
  }

  void addLocation() {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondScreenL()));
  }

  void addTodo() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondScreenT()));
  }

  void action() async {
    lastPlace = null;
    googleapis.clientViaServiceAccount(credentials, SCOPES).then((http_client) {
      var sheetApi = new googleapis.SheetsApi(http_client);
      sheetApi.spreadsheets.values
          .get('1th6HBdA9C-u1b-4OkXpSO_sBtlIOYFCScPVoICSnAfY', "foo")
          .then((ret) {
        values = ret.values;
        selectGPS();
      });
    });
  }

  void checkTodoList(GPS_lad, GPS_lng) {
    if (values == null) return;
    print('lad=$GPS_lad lng=$GPS_lng');

    print('action');
    setState(() {
      arrays.clear();
      arrays.add('loading...');
    });
    //action;
    setState(() {
      arrays.clear();
    });

    //there are checking todo from values.
    var empty = true;
    for (var i = 1; i < values.length; i++) {
      var A = values[i];
      double lad = double.parse(A[3]);
      double lng = double.parse(A[4]);
      if (GPS_lad != null && GPS_lng != null) {
        double kyori = getDistance(GPS_lad, GPS_lng, lad, lng); //, "M");
        print("$GPS_lad $GPS_lng kyori=$kyori");
        if (kyori < 1) {
          print("found todo item");
          setState(() {
            arrays.add("${A[0]} ▶︎ ${A[1]} (${A[2]})");
            print("array size =${arrays}");
          });
          empty = false;
          var itemPlace = values[i][0];
          if (itemPlace != lastPlace) {
            app.showNotification();
            lastPlace = itemPlace;
          }
        }
      } else {
        setState(() {
          arrays.clear();
          arrays.add("error: GPSを読み込めませんでした");
        });
        empty = false;
      }
    }
    if (empty == true) {
      setState(() {
        arrays.add("何もToDoはありません!(...'v'...)");
      });
    }
  }

  void selectGPS() async {
    var location = new Location();
    location.getLocation().then((currentLocation) {
      current.latitude = currentLocation['latitude'];
      current.longitude = currentLocation['longitude'];

      checkTodoList(current.latitude, current.longitude);
      //print("gps location $GPS_lad,$GPS_lng");
      //print('accuracy = $currentLocation["accuracy"]');
    });
  }

  void call(){
    launch("tel://");
  }

  void line(){
    launch("line:/nv/chat");
  }

  double radians(deg) {
    return deg * pi / 180.0;
  }

  double getDistance(lat1, lng1, lat2, lng2) {
    return 6378.14 *
        acos(cos(radians(lat1)) *
                cos(radians(lat2)) *
                cos(radians(lng2) - radians(lng1)) +
            sin(radians(lat1)) * sin(radians(lat2)));
  }
}