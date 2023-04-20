import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ログインスクリーン',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログインスクリーン'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(160.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: 'ユーザ名',
                ),
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'パスワード',
                ),
              ),
              
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homePage()
                        ),
                      );
                    },
                    child: const Text('ログイン'),
                  ),
                  OutlinedButton(
                    onPressed: (){},
                    child: const Text('新規登録')
                  )
                ],
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('いらっしゃいませ'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              // size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.home,
              // size: 30,
            ),
            onPressed: () {},
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: TextButton(
                    child: const Text('設定'),
                    onPressed: () {},
                  ),
                  // value: 'settings',
                ),
                PopupMenuItem(
                  child: TextButton(
                    child: const Text('ヘルプ'),
                    onPressed: () {},
                  ),
                  // value: 'help',
                )
              ];
            },
            // onSelected: (value) {
            // },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(160.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                      ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentScreen()),
                      );
                    },
                    child: const Text(
                      '支払う',
                      style: TextStyle(
                      fontSize: 30,
                      ),
                    ),
                    
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                      ),
                      onPressed: () {}, 
                      child: const Text(
                        '振込',
                        style: TextStyle(
                        fontSize: 30,
                        )
                      ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                      ),
                      onPressed: () {},
                      child: const Text('キャンセル',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                      ),

                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController _amountController = TextEditingController();

  Widget _buildKey(String value) {
    return Expanded(
      child: ElevatedButton(
        child: Text(
          value,
          style: TextStyle(fontSize: 32),
        ),
        onPressed: () {
          setState(() {
            _amountController.text += value;
          });
        },
      ),
    );
  }
Widget _buildKeys() {
    return Container(
      // constraints: const BoxConstraints(
      //   maxHeight: 500,
      //   maxWidth: 300,
      // ),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          _buildKey('1'),
          _buildKey('2'),
          _buildKey('3'),
          _buildKey('4'),
          _buildKey('5'),
          _buildKey('6'),
          _buildKey('7'),
          _buildKey('8'),
          _buildKey('9'),
          Expanded(
            child: Container(),
          ),
          _buildKey('0'),
          Expanded(
            child: ElevatedButton(
              child: Icon(Icons.backspace),
              onPressed: () {
                setState(() {
                  String text = _amountController.text;
                  if (text.isNotEmpty) {
                    _amountController.text = text.substring(0, text.length - 1);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the amount to pay:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount',
              ),
            ),
            SizedBox(height: 16.0),
            _buildKeys(),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String amount = _amountController.text;
                  // Xử lý thanh toán với số tiền đã nhập ở đây
                },
                child: Text('Pay'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
