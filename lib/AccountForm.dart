import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({super.key});

  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  void postData() {
    // 회원 정보 추가
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원정보 생성'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: '이름',
                  border: OutlineInputBorder(),
                ),
                controller: _nameController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: '신문고 아이디',
                  border: OutlineInputBorder(),
                ),
                controller: _idController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: '신문고 비밀번호',
                  border: OutlineInputBorder(),
                ),
                controller: _pwController,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: postData,
              child: const Text('등록하기'),
            ),
          ],
        ),
      ),
    );
  }
}
