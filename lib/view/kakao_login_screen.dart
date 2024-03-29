import 'package:ecology_collect/view/AiReport/image_select.dart';
import 'package:ecology_collect/view/Show/eco_show.dart';
import 'package:ecology_collect/view/kakao_login.dart';
import 'package:ecology_collect/view/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class KakaoLoginScreen extends StatefulWidget {
  const KakaoLoginScreen({super.key});

  @override
  State<KakaoLoginScreen> createState() => _KakaoLoginScreenState();
}

class _KakaoLoginScreenState extends State<KakaoLoginScreen> {
  final viewModel = LoginViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  '수달 탐정의 미션',
                  style: TextStyle(
                    color: Color(0xff50555C),
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  '한강의 생태를 찾아 모아보자!',
                  style: TextStyle(
                    color: Color(0xff50555C),
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  '한강 생태모아',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                  ),
                ),
                Image.asset(
                  'assets/image/logo.png',
                  width: 350,
                  fit: BoxFit.contain,
                ),
                InkWell(
                  child: Image.asset("assets/image/kakao_login.png"),
                  onTap: () async {
                    await viewModel.login();
                    setState(() {});
                    if (!mounted) return;
                    Get.to(() => Show());
                  },
                )

                //Text('${viewModel.isLogined}'), //login 여부 확인
              ],
            ),
          ),
        ),
      ),
    );
  }
}
