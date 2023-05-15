// //import 'package:flutter/material.dart';
// /*import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
// import 'package:la_via/bluetooth/bluetooth_device_list_ntry.dart';*/
//
// /*class BluetoothPage extends StatefulWidget {
//   @override
//   _BluetoothPageState createState() => _BluetoothPageState();
// }
//
// class _BluetoothPageState extends State<BluetoothPage> with WidgetsBindingObserver {
//   BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
//
//   List<BluetoothDevice> devices = <BluetoothDevice>[];
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     _getBTState();
//     _stateChangeListener();
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state.index == 0) {
//       //resume
//       if (_bluetoothState.isEnabled) {
//         _listBondedDevices();
//       }
//     }
//   }
//
//   _getBTState() {
//     FlutterBluetoothSerial.instance.state.then((state) {
//       _bluetoothState = state;
//       if (_bluetoothState.isEnabled) {
//         _listBondedDevices();
//       }
//       setState(() {});
//     });
//   }
//
//   _stateChangeListener() {
//     FlutterBluetoothSerial.instance
//         .onStateChanged()
//         .listen((BluetoothState state) {
//       _bluetoothState = state;
//       if (_bluetoothState.isEnabled) {
//         _listBondedDevices();
//       } else {
//         devices.clear();
//       }
//       print("State isEnabled: ${state.isEnabled}");
//       setState(() {});
//     });
//   }
//
//   _listBondedDevices() {
//     FlutterBluetoothSerial.instance
//         .getBondedDevices()
//         .then((List<BluetoothDevice> bondedDevices) {
//       devices = bondedDevices;
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ESP32CAM BLUETOOTH SERIAL"),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             SwitchListTile(
//               title: Text('Enable Bluetooth'),
//               value: _bluetoothState.isEnabled,
//               onChanged: (bool value) {
//                 future() async {
//                   if (value) {
//                     await FlutterBluetoothSerial.instance.requestEnable();
//                   } else {
//                     await FlutterBluetoothSerial.instance.requestDisable();
//                   }
//                   future().then((_) {
//                     setState(() {});
//                   });
//                 }
//               },
//             ),
//             ListTile(
//               title: Text("Bluetooth STATUS"),
//               subtitle: Text(_bluetoothState.toString()),
//               trailing: InkWell(
//                 child: Text("Settings"),
//                 onTap: () {
//                   FlutterBluetoothSerial.instance.openSettings();
//                 },
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 children: devices
//                     .map((_device) =>
//                     BluetoothDeviceListEntry(
//                       device: _device,
//                       enabled: true,
//                       onTap: () {
//                         print("Item");
//                       }, onLongPress: () {}, rssi:,))
//                     .toList(),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
