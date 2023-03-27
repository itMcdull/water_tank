import 'package:flutter/material.dart';
import 'package:flutter_water_tank/utils/ble.device.dart';
import 'package:flutter_water_tank/utils/ble_callback.dart';
import 'package:flutter_water_tank/utils/ble_device_bean.dart';
import 'package:flutter_water_tank/utils/ble_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController implements BleCallBack {
  HomeController();
  TextEditingController waterTemperature = TextEditingController();
  TextEditingController oxygen = TextEditingController();
  //设备类
  late DeviceBean device;
  //蓝牙设备
  late BleDevice bleDevice;

  _initData() {
    if (UluckyService.instance.bleDevice != null) {
      bleDevice = UluckyService.instance.bleDevice!;
      debugPrint('-=--------------------------------');
      debugPrint(bleDevice.deviceName.toString());
      debugPrint('-=--------------------------------');
    }
    update(["home"]);
  }

  @override
  void onInit() {
    _initData();
    //比如说查询温度 你一进来就可以先发送查询指令 例如
    // CommonBleUtils.send(bleDevice, 0x60, [6, 0], false);
    //这个bledevice 就是这个连接的设备 后面 就是指令头 具体的指令 最后的false固定不用管就行 
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void connectFailListener(BleDevice bleDevice) {
  }

  @override
  void connectListener(BleDevice bleDevice) {
  }

  @override
  void dataListener(String deviceId, List<int> data) {
    //这里接收蓝牙版的广播  比如你发送一条查询指令 在这里可以拿到data
  }

  @override
  void deviceFailListener() {
  }

  @override
  void disconnectListener() {
  }

  @override
  void scanFailListener() {
  }

  @override
  void scanListener(List<BleDevice> list) {
  }

  @override
  void stopScanListener() {
  }

  @override
  void onClose() {
    super.onClose();
  }
}
