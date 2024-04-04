import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '회원가입'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Set<String> idList = {};
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.lightBlue,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // 회원가입 폼
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "이름",
                        )),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: '이름을 입력하세요',
                      ),
                      validator: (String? value) {
                        if (value == null ||
                            value.length < 2 ||
                            value.length > 5) {
                          return '이름은 2글자 이상 4글자 이하의 한글이어야 합니다.';
                        }
                        return null;
                      },
                    ), // input : name
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "아이디",
                        )),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: '아이디를 입력하세요',
                      ),
                      validator: (String? value) {
                        if (value == null || idList.contains(value)) {
                          return '해당 아이디는 이미 존재하는 아이디입니다.';
                        }
                        // TODO : 중복체크 버튼 만들어서 validate
                        idList.add(value);
                        return null;
                      },
                    ), // input : id
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "비밀번호",
                        )),
                        TextFormField(
                      decoration: const InputDecoration(
                        hintText: '영문과 숫자를 포함한 8자 이상의 비밀번호를 입력하세요',
                      ),
                      
                    ), // input : password
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "비밀번호 확인",
                        )),
                        TextFormField(
                      decoration: const InputDecoration(
                        hintText: '같은 비밀번호를 한번 더 입력해주세요',
                      ),
                      validator: (value) => ,
                      // TODO : 기존에 입력한 비밀번호와 대조하기 (보안성 지키면서)
                    ), // 비밀번호 확인
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                          onPressed: () {
                            // validate will return true, else false
                            if (_formKey.currentState!.validate()) {
                              // db로 데이터 보내기
                            }
                          },
                          child: const Text("Submit")),
                    )
                  ],
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
