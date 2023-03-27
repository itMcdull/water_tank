import 'package:flutter/material.dart';
import 'package:flutter_water_tank/utils/input_widget.dart';
import 'package:get/get.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView(HomeController _) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14))),
      margin: const EdgeInsets.all(18),
      padding: const EdgeInsets.all(18),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: const [
                  Icon(
                    Icons.check_circle_outline_outlined,
                    size: 20,
                    color: Color(0xff808080),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('水温'),
                ],
              ),
            ),
            const Divider(
              height: 0,
              color: Color(0xffcccccc),
            ),
            SizedBox(
              height: 60,
              width: Get.width,
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      '含氧量控制',
                      style: TextStyle(color: Color(0xff212121), fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: TDLTextField(
                      controller: _.oxygen,
                      hintText: '当前含氧量',
                      textAlign: TextAlign.end,
                      hintColor: const Color(0xffA6A6A6),
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.done,
                      onEditingComplete: () {
                        //这里写填入的水平 发送蓝牙指令
                      },
                      isSystem: true,
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              height: 0,
              color: Color(0xffcccccc),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: const [
                  Icon(
                    Icons.check_circle_outline_outlined,
                    size: 20,
                    color: Color(0xff808080),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('水温'),
                ],
              ),
            ),
            const Divider(
              height: 0,
              color: Color(0xffcccccc),
            ),
            SizedBox(
              height: 60,
              width: Get.width,
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      '当前水温',
                      style: TextStyle(color: Color(0xff212121), fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: TDLTextField(
                      controller: _.waterTemperature,
                      hintText: '默认的水温',
                      textAlign: TextAlign.end,
                      hintColor: const Color(0xffA6A6A6),
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.send,
                      onEditingComplete: () {
                        //这里写填入的水平 发送蓝牙指令
                        debugPrint(_.waterTemperature.text);
                      },
                      isSystem: true,
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              height: 0,
              color: Color(0xffcccccc),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color(0xfff4f4fa),
          appBar: AppBar(
            title: const Text("设备控制页面",
                style: TextStyle(color: Color(0xff212121), fontSize: 14)),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
            child: _buildView(_),
          ),
        );
      },
    );
  }
}
