import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:woojoo/common/constants.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/fcm/fcm_manager.dart';
import 'package:woojoo/utils/notification.dart';
import 'package:woojoo/utils/woojoo_groups.dart';

import '../../../../common/appbar/text_app_bar.dart';
import '../../../../common/widget/button/w_rounded_button.dart';
import '../../../../common/widget/input/w_outline_input.dart';
import '../../../../common/widget/input/w_outline_input_readonly.dart';

class Step1ProfileScreen extends StatefulWidget {
  const Step1ProfileScreen({Key? key}) : super(key: key);

  @override
  State<Step1ProfileScreen> createState() => _Step1ProfileScreenState();
}

class _Step1ProfileScreenState extends State<Step1ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final String _phoneNumber = Get.arguments;
  final TextEditingController _typeAheadGroupController =
      TextEditingController();
  final List<String> _groups = [];
  XFile? _image;
  String? _name;
  String _detail1 = '1';

  bool isName = false;
  bool isGroup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.mainBackgroundColor,
      appBar: const TextAppBar(title: "프로필 설정"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => getImageFromGallery(),
                  child: Stack(
                    children: [
                      _image == null
                          ? CircleAvatar(
                              radius: 55,
                              backgroundImage: Image.asset(
                                "$basePath/default.png",
                                fit: BoxFit.cover,
                              ).image,
                            )
                          : CircleAvatar(
                              radius: 55,
                              backgroundImage: Image.file(
                                File(_image!.path),
                                fit: BoxFit.cover,
                              ).image,
                            ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blueAccent,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                OutlineInput(
                  onSaved: (val) {
                    setState(() => _name = val);
                  },
                  onChanged: (val) {
                    if (val != null && val.isNotEmpty) {
                      setState(() => isName = true);
                    }
                  },
                  validator: (val) => null,
                  labelText: "이름을 입력해주세요",
                  autoFocus: true,
                ),
                const SizedBox(height: 8),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      textInputAction: TextInputAction.next,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: context.appColors.text,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 52, 52, 71),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: Colors.blueAccent, width: 2),
                        ),
                        fillColor: context.appColors.inputField,
                        filled: true,
                        labelText: "학교를 입력해주세요",
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 206, 206, 215),
                          fontSize: 20,
                        ),
                      ),
                      controller: _typeAheadGroupController,
                      onChanged: (val) {
                        if (val.isEmpty || !WoojooGroups.states.contains(val)) {
                          setState(() => isGroup = false);
                        } else if (WoojooGroups.states.contains(val)) {
                          setState(() {
                            _groups.clear(); // 그룹 여러개로 했을 때 지워야됨
                            _groups.add(val);
                            isGroup = true;
                          });
                        }
                      },
                    ),
                    suggestionsCallback: (pattern) {
                      return WoojooGroups.getSuggestions(pattern);
                    },
                    transitionBuilder: (context, suggestionsBox, controller) {
                      return suggestionsBox;
                    },
                    suggestionsBoxDecoration: SuggestionsBoxDecoration(
                        color: context.appColors.inputField),
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(
                          suggestion.toString(),
                          style: TextStyle(color: context.appColors.text),
                        ),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      _typeAheadGroupController.text = suggestion.toString();
                      setState(() {
                        _groups.clear();
                        _groups.add(_typeAheadGroupController.text);
                        isGroup = true;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  height: 60,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 62, 62, 75),
                      filled: true,
                      labelText: '학년을 입력해주세요',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 206, 206, 215),
                          fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 52, 52, 71),
                              width: 2)),
                    ),
                    child: DropdownButton<String>(
                        value: _detail1,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: TextStyle(color: context.appColors.text),
                        isExpanded: true,
                        dropdownColor: context.appColors.mainBackgroundColor,
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _detail1 = newValue!;
                          });
                        },
                        items: _groups.isEmpty || _groups[0].contains("초등학교")
                            ? <String>['1', '2', '3', '4', '5', '6']
                                .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(fontSize: 20)),
                                );
                              }).toList()
                            : <String>['1', '2', '3']
                                .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                );
                              }).toList()),
                  ),
                ),
                OutlineInputReadOnly(
                  labelText: "전화번호",
                  hintText: _phoneNumber,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundedButton(
                    btnEnabled: (isName && isGroup),
                    onPressed: _onPressed,
                    text: "다음"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onPressed() {
    _formKey.currentState!.save();
    if (!WoojooGroups.states.contains(_groups[0])) {
      notification(context, "학교 이름을 확인해주세요!");
    } else {
      String? fcmToken = FcmManager.token;
      Get.toNamed('/auth/signup/step2', arguments: {
        "file": _image,
        "name": _name,
        "groups": _groups,
        "detail1": _detail1,
        "phoneNumber": _phoneNumber,
        "fcmToken": fcmToken
      });
    }
  }

  Future getImageFromGallery() async {
    final status = await Permission.photos.request();
    if (status == PermissionStatus.granted) {
      await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 30)
          .then((image) {
        setState(() {
          _image = image;
        });
      });
    }
  }
}
