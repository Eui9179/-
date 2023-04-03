import 'dart:async';
import 'dart:io';

import 'package:woojoo/controller/access_token_controller.dart';
import 'package:woojoo/controller/my_friends_controller.dart';
import 'package:woojoo/controller/my_games_controller.dart';
import 'package:woojoo/controller/my_groups_controller.dart';
import 'package:woojoo/controller/my_profile_controller.dart';
import 'package:woojoo/dio/auth/withdrawal.dart';
import 'package:woojoo/dio/dio_instance.dart';
import 'package:woojoo/dio/profile/update_my_profile.dart';
import 'package:woojoo/main.dart';
import 'package:woojoo/ui/dynamic_widget/font/font.dart';
import 'package:woojoo/utils/color_palette.dart';
import 'package:woojoo/utils/woojoo_groups.dart';
import 'package:woojoo/utils/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  final List<String> _groups = [];
  XFile? _image;
  String? _name;
  String _originImage = '';
  String _detail1 = '1';
  bool _isName = true;
  bool _isNameChange = false;
  bool _isGroup = true;
  bool _isGroupChange = false;
  bool _isFile = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    //TODO: 현재는 그룹 한개만
    _typeAheadController.text =
        Get.find<MyGroupsController>().groups[0]["name"];
    _detail1 = Get.find<MyGroupsController>().groups[0]["detail1"];
    _name = Get.find<MyProfileController>().name;
    _originImage = Get.find<MyProfileController>().profileImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.mainBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorPalette.headerBackgroundColor,
        title: const Font(text: '설정', size: 22),
        actions: [
          TextButton(
              onPressed: _onUpdateProfile,
              child: _isLoading
                  ? const Text(
                      '완료',
                      style:
                          TextStyle(color: ColorPalette.subFont, fontSize: 22),
                    )
                  : const Text(
                      '완료',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 22),
                    ))
        ],
      ),
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
                  onTap: () {
                    getImageFromGallery();
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.black54,
                          child: _image == null
                              ? _originImage == 'default.png'
                                  ? const CircleAvatar(
                                      backgroundImage: AssetImage(
                                        "assets/images/logo/default.png",
                                      ),
                                      radius: 55,
                                    )
                                  : CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          '$cdnProfileImageBaseUri$_originImage'),
                                      radius: 55.0,
                                    )
                              : CircleAvatar(
                                  radius: 55,
                                  backgroundImage: Image.file(
                                    File(_image!.path),
                                    fit: BoxFit.cover,
                                  ).image,
                                )),
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
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: _name,
                        autofocus: false,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.always,
                        onSaved: (val) {
                          setState(() {
                            _name = val;
                          });
                        },
                        onChanged: (val) {
                          if (val.isEmpty) {
                            setState(() {
                              _isName = false;
                            });
                          } else {
                            setState(() {
                              _isName = true;
                              _isNameChange = true;
                            });
                          }
                        },
                        validator: (val) {
                          return null;
                        },
                        style: const TextStyle(
                            fontSize: 20.0, color: ColorPalette.font),
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 62, 62, 75),
                          filled: true,
                          labelText: '이름',
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 206, 206, 215),
                              fontSize: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 52, 52, 71),
                                  width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                  color: Colors.blueAccent, width: 2)),
                        ),
                      ),
                    ],
                  ),
                ),
                TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(
                          fontSize: 20.0, color: ColorPalette.font),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 52, 52, 71),
                                width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Colors.blueAccent, width: 2)),
                        fillColor: const Color.fromARGB(255, 62, 62, 75),
                        filled: true,
                        labelText: "학교",
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 206, 206, 215),
                            fontSize: 20),
                      ),
                      controller: _typeAheadController,
                      onChanged: (val) {
                        if (val.isEmpty || !WoojooGroups.states.contains(val)) {
                          setState(() {
                            _isGroup = false;
                          });
                        } else if (WoojooGroups.states.contains(val)) {
                          setState(() {
                            _groups.clear(); // 그룹 여러개로 했을 때 지워야됨
                            _groups.add(val);
                            if (!val.contains('초등학교') &&
                                ['4', '5', '6'].contains(_detail1)) {
                              _detail1 = '1';
                            }
                            _isGroup = true;
                            _isGroupChange = true;
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
                    suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                        color: ColorPalette.boxFillColor),
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        tileColor: ColorPalette.boxFillColor,
                        title: Text(
                          suggestion.toString(),
                          style: const TextStyle(color: ColorPalette.font),
                        ),
                      );
                    },
                    noItemsFoundBuilder: (value) {
                      return Container(
                          padding: const EdgeInsets.only(
                              top: 13, bottom: 13, left: 13),
                          child: const Text(
                            '검색 결과가 없습니다.',
                            style: TextStyle(
                                fontSize: 15, color: ColorPalette.font),
                          ));
                    },
                    onSuggestionSelected: (suggestion) {
                      _typeAheadController.text = suggestion.toString();
                      setState(() {
                        _groups.clear();
                        _groups.add(_typeAheadController.text);
                        if (!_typeAheadController.text.contains('초등학교') &&
                            ['4', '5', '6'].contains(_detail1)) {
                          _detail1 = '1';
                        }
                        _isGroup = true;
                        _isGroupChange = true;
                      });
                    }),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  height: 60,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      fillColor: ColorPalette.boxFillColor,
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
                    child: DropdownButton(
                        value: _detail1,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: const TextStyle(color: ColorPalette.font),
                        isExpanded: true,
                        dropdownColor: ColorPalette.boxFillColor,
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _detail1 = newValue!;
                            _isGroupChange = true;
                          });
                        },
                        items: _groups.isEmpty || _groups[0].contains("초등학교")
                            ? ['1', '2', '3', '4', '5', '6']
                                .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                );
                              }).toList()
                            : ['1', '2', '3']
                                .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: const TextStyle(fontSize: 20)),
                                );
                              }).toList()),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextButton(
                    onPressed: _onLogout,
                    child: const Text(
                      '로그아웃',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    )),
                TextButton(
                    onPressed: () {
                      launchUrl(Uri.parse("https://discord.gg/MTyBVZ72S9"),
                          mode: LaunchMode.externalApplication);
                    },
                    child: const Text(
                      '고객센터',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    )),
                TextButton(
                    onPressed: () {
                      _showTextInputDialog(context);
                    },
                    child: const Text(
                      '회원탈퇴',
                      style: TextStyle(
                          color: ColorPalette.subFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onUpdateProfile() {
    setState(() {
      _isLoading = true;
    });
    if (_isName && _isGroup) {
      _formKey.currentState!.save();
      String accessToken = Get.find<AccessTokenController>().accessToken;
      Map profileData = {
        'isFile': _isFile,
        'file': _image,
        'name': _isNameChange ? _name : null,
        //TODO: 그룹이 하나일때만

        'groupName': _isGroupChange ? _typeAheadController.text : null,
        'groupDetail1': _isGroupChange ? _detail1 : null,
        'isGroup': _isGroupChange,
      };
      Future<Map<String, dynamic>> response =
          dioApiUpdateMyProfile(profileData, accessToken);
      response.then((res) {
        setState(() {
          _isLoading = false;
        });
        int statusCode = res["statusCode"];
        if (statusCode == 200) {
          Get.find<MyProfileController>().setMyName(_name!);
          Get.find<MyGroupsController>().setMyGroups([
            {'name': _typeAheadController.text, 'detail1': _detail1}
          ]);
          Get.find<MyProfileController>().setMyProfileImage(res['data']);
          notification(context, '저장 완료!', warning: false);
        } else if (statusCode == 401) {
          notification(context, "다시 로그인 해주세요");
        } else {
          notification(context, statusCode.toString());
        }
      });
    } else if (!_isName) {
      notification(context, '이름을 입력해주세요');
    } else if (!_isGroup) {
      notification(context, '소속을 입력해주세요');
    }
  }

  _onLogout() {
    storage.delete(key: "accessToken");
    Get.offAllNamed('/login');
  }

  _onWithdrawal() {
    String accessToken = Get.find<AccessTokenController>().accessToken;
    Future<Map<String, dynamic>> response = dioApiWithdrawal(accessToken);
    response.then((res) {
      int statusCode = res['statusCode'];
      if (statusCode == 200) {
        storage.delete(key: "accessToken");
        Get.find<AccessTokenController>().clear();
        Get.find<MyGroupsController>().clear();
        Get.find<MyProfileController>().clear();
        Get.find<MyFriendsController>().clear();
        Get.find<MyGamesController>().clear();
        Get.offAllNamed('/');
      } else {
        notification(context, '죄송합니다. 다시 실행시켜주세요[$statusCode]');
      }
    });
  }

  Future getImageFromGallery() async {
    // var status = await Permission.storage.status;
    final status = await Permission.photos.request();
    if (status == PermissionStatus.granted) {
      await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 30)
          .then((image) {
        setState(() {
          _image = image;
          if (image == null) {
            _originImage = 'default';
          }
          _isFile = true;
        });
      });
    }
  }

  Future<String?> _showTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: ColorPalette.mainBackgroundColor,
            contentPadding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            actionsAlignment: MainAxisAlignment.spaceAround,
            title: SizedBox(
              height: 80,
              child: Column(
                children: const [
                  Text(
                    '회원 탈퇴',
                    style: TextStyle(color: ColorPalette.font, fontSize: 23),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '회원탈퇴시 저장되어 있는 \n모든 데이터가 삭제됩니다',
                    style: TextStyle(color: ColorPalette.subFont, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    '취소',
                    style: TextStyle(color: ColorPalette.font, fontSize: 20),
                  )),
              TextButton(
                  onPressed: () {
                    _onWithdrawal();
                  },
                  child: const Text(
                    '완료',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                  )),
            ],
          );
        });
  }
}
