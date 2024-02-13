import 'package:flutter/material.dart';
import '/widgets/button.dart';
import '/widgets/currency_card.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Hey, Selena",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.w700),
                        ),
                        Text("Welcome back",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 18,
                  ),
                ),
                const Text(
                  "\$5 354 234",
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                        text: "Transfer",
                        bgColor: Colors.amber,
                        textColor: Colors.black),
                    Button(
                        text: "Request",
                        bgColor: Colors.black54,
                        textColor: Colors.white),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Wallets",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700)),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const CurrencyCard(
                  name: 'Euro',
                  code: "Euro",
                  amount: "6 428",
                  icon: Icons.euro,
                  isInverted: false,
                  order: 1,
                ),
                const CurrencyCard(
                  name: 'Dollar',
                  code: "USD",
                  amount: "5 428",
                  icon: Icons.currency_bitcoin,
                  isInverted: true,
                  order: 2,
                ),
                const CurrencyCard(
                  name: 'Dollar',
                  code: "USD",
                  amount: "428",
                  icon: Icons.money,
                  isInverted: false,
                  order: 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
