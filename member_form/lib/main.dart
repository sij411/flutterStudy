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
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  Set<String> idList = {};

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
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
                    Column(
                      children: [
                        TextFormField(
                          controller: _idController,
                          decoration: const InputDecoration(
                            hintText: "IDd를 입력하세요",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ElevatedButton(
                            child: const Text('중복 확인'),
                            onPressed: () {
                              if (idList.contains(_idController.text)) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                        content: Text(
                                            "이미 존재하는 ID입니다. \n 다른 아이디를 입력해주세요."),
                                      );
                                    });
                              }
                            },
                          ),
                        )
                      ],
                    ),
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
    );
  }
}
