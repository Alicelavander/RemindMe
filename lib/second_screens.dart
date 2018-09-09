import 'package:flutter/material.dart';
import 'package:googleapis/sheets/v4.dart' as googleapis;
import 'package:googleapis_auth/auth_io.dart' as googleapis;
import 'package:thisisatest/main.dart' as main;

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
class SecondScreenL extends StatefulWidget{
  @override
  _SecondScreenForLocation createState() => _SecondScreenForLocation();
}
class SecondScreenT extends StatefulWidget{
  @override
  _SecondScreenForTodo createState() => _SecondScreenForTodo();

}

class _SecondScreenForLocation extends State<SecondScreenL> {
  final myControllerForPlaceName = TextEditingController();
  final myControllerForLatitude = TextEditingController();
  final myControllerForLongitude = TextEditingController();
  var errorTrue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("場所の登録")),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: new Builder(
          builder: (BuildContext context) {
            return new Column(
              children: <Widget>[
                const SizedBox(height: 30.0,),
                TextField(
                  controller: myControllerForPlaceName,
                  onChanged: savePlaceName,
                  decoration: InputDecoration(
                      hintText: '場所の名前を入力してください'
                  ),
                ),
                const SizedBox(height: 30.0,),
                TextField(
                  controller: myControllerForLatitude,
                  onChanged: saveLatitude,
                  decoration: InputDecoration(
                      hintText: '緯度を入力してください'
                  ),
                ),
                const SizedBox(height: 30.0,),
                TextField(
                  controller: myControllerForLongitude,
                  onChanged: saveLongitude,
                  decoration: InputDecoration(
                      hintText: '経度を入力してください'
                  ),
                ),
                const SizedBox(height: 100.0,),
                RaisedButton(
                  child: const Text('登録'),
                  color: new Color(0xFF90CAF9),
                  elevation: 4.0,
                  onPressed: () {
                    sendInfo();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  savePlaceName(str) {
        (str) {
      setState(() {
        str = myControllerForPlaceName.text;
      });
    };
  }

  saveLatitude(str){
        (str) {
      setState(() {
        str = myControllerForLatitude.text;
      });
    };
  }

  saveLongitude(str){
        (str) {
      setState(() {
        str = myControllerForLongitude.text;
      });
    };
  }

  sendInfo() async {
    googleapis.clientViaServiceAccount(main.credentials, main.SCOPES).then((
        http_client) {
      var sheetApi = new googleapis.SheetsApi(http_client);
      sheetApi.spreadsheets.values.get(
          '1th6HBdA9C-u1b-4OkXpSO_sBtlIOYFCScPVoICSnAfY', "Place").then((ret) {
        ret.values.add(
            [myControllerForPlaceName.text, myControllerForLatitude.text, myControllerForLongitude.text]);
        setState(() {
          myControllerForPlaceName.clear();
          myControllerForLatitude.clear();
          myControllerForLongitude.clear();
        });
        sheetApi.spreadsheets.values.update(
            ret, '1th6HBdA9C-u1b-4OkXpSO_sBtlIOYFCScPVoICSnAfY', ret.range,
            valueInputOption: 'RAW');
        errorTrue = false;
      });
    })
        .catchError((e) {
      error();
    });
    if (errorTrue == false){
      showDialog(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
          title: new Text("登録完了"),
          content: new Text("場所の登録が完了いたしました。"),
        ),
      );
    };
  }

  error() {
    errorTrue = true;
    showDialog(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
        title: new Text("ネットワークエラー"),
        content: new Text("データ送信時にエラーが起きました。ネットワークに繋がっていることを確認してから再度お試しください。"),
      ),
    );
  }
}

class _SecondScreenForTodo extends State<SecondScreenT> {
  List<List<Object>> values;
  final myControllerForPlace = TextEditingController();
  final myControllerForToDo = TextEditingController();
  final myControllerForDate = TextEditingController();
  var errorTrue = true;
  List<DropdownMenuItem<Text>> PlaceItems = [];


  loadData() {
    PlaceItems.add(new DropdownMenuItem(child: new Text('場所を選択してください')));
    googleapis.clientViaServiceAccount(credentials, SCOPES).then((http_client) {
      var sheetApi = new googleapis.SheetsApi(http_client);
      sheetApi.spreadsheets.values.get('1th6HBdA9C-u1b-4OkXpSO_sBtlIOYFCScPVoICSnAfY', "foo").then((ret) {
        values = ret.values;
        for(var i=1; i<values.length; i++){
          var A = values[i];
          PlaceItems.add(new DropdownMenuItem(child: new Text(A[0])));
        }
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    loadData();
    return Scaffold(
      appBar: AppBar(title: const Text("Todoの登録")),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: new Builder(
          builder: (BuildContext context) {
            return new Column(
              children: <Widget>[
                const SizedBox(height: 30.0,),
                //TODO: 場所を選べないです！！
                DropdownButton(
                  items: PlaceItems,
                  onChanged: savePlace,
                  hint: Text('場所を選択してください'),
                ),
                const SizedBox(height: 30.0,),
                TextField(
                  controller: myControllerForToDo,
                  onChanged: saveToDo,
                  decoration: InputDecoration(hintText: 'ToDoを入力してください'),
                ),
                const SizedBox(height: 30.0,),
                TextField(
                  controller: myControllerForDate,
                  onChanged: saveDate,
                  decoration: InputDecoration(hintText: '日付を入力してください'),
                ),
                const SizedBox(height: 100.0,),
                RaisedButton(
                  child: const Text('登録'),
                  color: new Color(0xFF90CAF9),
                  elevation: 4.0,
                  onPressed: () {
                    sendInfo();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  sendInfo() async {
    googleapis.clientViaServiceAccount(main.credentials, main.SCOPES).then((
        http_client) {
      var sheetApi = new googleapis.SheetsApi(http_client);
      sheetApi.spreadsheets.values.get(
          '1th6HBdA9C-u1b-4OkXpSO_sBtlIOYFCScPVoICSnAfY', "ToDos").then((ret) {
        ret.values.add(
            [myControllerForPlace.text, myControllerForToDo.text, myControllerForDate.text]);
        setState(() {
          myControllerForPlace.clear();
          myControllerForToDo.clear();
          myControllerForDate.clear();
        });
        sheetApi.spreadsheets.values.update(
          ret, '1th6HBdA9C-u1b-4OkXpSO_sBtlIOYFCScPVoICSnAfY', ret.range,
        valueInputOption: 'RAW');
        errorTrue = false;
      });
    })
    .catchError((e) {
      error();
    });
    if (errorTrue == false){
      showDialog(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
          title: new Text("登録完了"),
          content: new Text("ToDoの登録が完了いたしました。"),
        ),
      );
    };
  }

  savePlace(str) {
        (str) {
      setState(() {
        str = myControllerForPlace.text;
      });
    };
  }

  saveToDo(str) {
        (str) {
      setState(() {
        str = myControllerForToDo.text;
      });
    };
  }

  saveDate(str) {
        (str) {
      setState(() {
        str = myControllerForDate.text;
      });
    };
  }

  show() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(myControllerForPlace.text + ',' + myControllerForToDo.text + ',' + myControllerForDate.text),
        );
      },
    );
  }

  error() {
    errorTrue = true;
    showDialog(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
        title: new Text("ネットワークエラー"),
        content: new Text("データ送信時にエラーが起きました。ネットワークに繋がっていることを確認してから再度お試しください。"),
      ),
    );
  }
}