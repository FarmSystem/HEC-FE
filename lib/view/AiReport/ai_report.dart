import 'dart:io';

import 'package:ecology_collect/view/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:ecology_collect/view/widgets/menu_bottom.dart';
import 'package:ecology_collect/view/widgets/menu_drawer.dart';
import 'package:ecology_collect/view/widgets/top_appbar.dart';
import 'package:image_picker/image_picker.dart';

class AiReport extends StatefulWidget {
  const AiReport({Key? key, this.selectedImage}) : super(key: key);

  final XFile? selectedImage; // 선택된 이미지를 전달 받습니다.

  @override
  _AiReportState createState() => _AiReportState();
}

// 나머지 부분은 동일

class _AiReportState extends State<AiReport> {
  final _hangangs = [
    '여의도 한강공원',
    '반포 한강공원',
    '잠원 한강공원',
    '잠실 한강공원',
    '광나루 한강공원',
    '뚝섬 한강공원',
    '이촌 한강공원',
    '망원 한강공원',
    '난지 한강공원',
    '강서 한강공원',
    '양화 한강공원',
  ];
  String? _selectedHangang;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedHangang = _hangangs[0];
    });
  }

  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: '탐정 보고서',
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0), // 왼쪽과 오른쪽 패딩 10
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                if (widget.selectedImage != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.file(
                      File(widget.selectedImage!.path),
                      height: 270,
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffB8E3AA),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: const Color(0xff395831),
                      width: 1.0, // 선의 너비
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '▼  수달 탐정의 분석 결과',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        'https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FLz4v4%2Fbtq7XthY041%2FsvdwCxxLKYJ3AW3ktOAkxk%2Fimg.jpg',
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const SizedBox(
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '송엽국', // 제목 텍스트
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '송엽국은 잎은 소나무를 닮았고 꽃은 국화를 닮았다고 하여 송엽국입니다. 즉 소나무잎 국화라는 이름이 붙었는데 이것 외에도 솔잎국화, 송엽, 사계국화, 사철채송화, 등 다양한 이름이 있습니다',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: AutofillHints.creditCardSecurityCode,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '* 발견 위치와 시간을 입력해주세요',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 240,
                              height: 50,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: const Color(0xffDFDFE6), width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: SizedBox(
                                    child: DropdownButton(
                                      style: const TextStyle(
                                        color: Color(0xff87898E),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AutofillHints
                                            .creditCardSecurityCode,
                                      ),
                                      isExpanded: true,
                                      underline: Container(),
                                      value: _selectedHangang,
                                      items: _hangangs
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(e),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedHangang = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 130,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: const Color(0xffDFDFE6),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15), // 왼쪽과 오른쪽에 10씩의 패딩 설정
                                    child: TextButton(
                                      onPressed: () async {
                                        final TimeOfDay? selectedTime =
                                            await showTimePicker(
                                          context: context,
                                          initialTime: _selectedTime,
                                        );

                                        if (selectedTime != null &&
                                            selectedTime != _selectedTime) {
                                          setState(() {
                                            _selectedTime = selectedTime;
                                          });
                                        }
                                      },
                                      child: Text(
                                        _selectedTime.format(context),
                                        style: const TextStyle(
                                          color: Color(0xff87898E),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: AutofillHints
                                              .creditCardSecurityCode,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '도감에 저장하여 수달 탐정의 미션을 완료하세요!',
                      style: TextStyle(
                        color: Color(0xff87898E),
                        fontFamily: AutofillHints.creditCardSecurityCode,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                ElevatedButton(
                  onPressed: () {
                    showCustomDialog(
                        context, "도감에 저장완료!", "닫기", "도감으로 이동", () {}, () {
                      Navigator.of(context).pop();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffB8E3AA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(350, 65),
                    side: const BorderSide(
                      color: Color(0xff395831), // 선 색상
                      width: 1.0, // 선 너비
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '도감에 저장하기', // 버튼 텍스트
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ), // 저장 아이콘
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
