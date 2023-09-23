import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/font_size.dart';
import 'package:woojoo/common/widget/avatar/w_profile_avatar.dart';
import 'package:woojoo/common/widget/w_height.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/data/memory/authentication/authentication_data.dart';
import 'package:woojoo/data/memory/game/game_data.dart';
import 'package:woojoo/data/memory/user/update_my_profile_request.dart';
import 'package:woojoo/data/memory/user/user_simple_data.dart';
import 'package:woojoo/main.dart';
import 'package:woojoo/screen/main/tab/setting/setting_data.dart';
import 'package:woojoo/utils/notification.dart';
import 'package:woojoo/utils/woojoo_groups.dart';

import '../../../../../data/controller/my_friends_controller.dart';
import '../../../../../data/controller/my_groups_controller.dart';
import '../../../../../data/controller/my_profile_controller.dart';
import '../../../../data/memory/group/dto_group.dart';
import '../../../../data/memory/group/group_data.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with
        AuthenticationDataProvider,
        SettingDataProvider,
        UserSimpleDataProvider {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Get.put(SettingData());
    _typeAheadController.text = settingData.groupName;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: context.appColors.mainBackgroundColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: context.appColors.headerBackgroundColor,
          title: '설정'.text.size(FontSize.appBarTitle).make(),
          actions: [
            TextButton(
              onPressed: _onUpdateProfile,
              child: settingData.rxIsLoading.value
                  ? '완료'
                      .text
                      .color(context.appColors.subText)
                      .size(FontSize.appBarTextButton)
                      .make()
                  : '완료'
                      .text
                      .color(context.appColors.textButton)
                      .size(FontSize.appBarTextButton)
                      .make(),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Container(
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
                          CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.black54,
                            child: settingData.image == null
                                ? ProfileAvatar(
                                    image: settingData.originImageName,
                                    size: 55,
                                  )
                                : CircleAvatar(
                                    radius: 55,
                                    backgroundImage: Image.file(
                                      File(settingData.image!.path),
                                      fit: BoxFit.cover,
                                    ).image,
                                  ),
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
                    height20,
                    Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: settingData.userName,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            autovalidateMode: AutovalidateMode.always,
                            onSaved: (val) {
                              if (val.isNotEmptyAndNotNull) {
                                settingData.userName =  val!;
                              }
                            },
                            onChanged: (val) {
                              if (val.isEmpty) {
                                settingData.isName = false;
                              } else {
                                settingData.isName = true;
                                settingData.isNameChanged = true;
                              }
                            },
                            validator: (val) => null,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: context.appColors.text,
                            ),
                            decoration: InputDecoration(
                              fillColor: const Color.fromARGB(255, 62, 62, 75),
                              filled: true,
                              labelText: '이름',
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 206, 206, 215),
                                fontSize: 20,
                              ),
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
                                  color: Colors.blueAccent,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                              fontSize: 20.0, color: context.appColors.text),
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
                              fontSize: 20,
                            ),
                          ),
                          controller: _typeAheadController,
                          onChanged: (val) {
                            if (val.isEmpty ||
                                !WoojooGroups.states.contains(val)) {
                              settingData.isGroup = false;
                            } else if (WoojooGroups.states.contains(val)) {
                              settingData.groupName = val;
                              settingData.isGroup = true;
                              settingData.isGroupChanged = true;
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
                          color: context.appColors.boxFillColor,
                        ),
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            tileColor: context.appColors.boxFillColor,
                            title: suggestion
                                .toString()
                                .text
                                .color(context.appColors.text)
                                .make(),
                          );
                        },
                        noItemsFoundBuilder: (value) {
                          return Container(
                            padding: const EdgeInsets.only(
                                top: 13, bottom: 13, left: 13),
                            child: '검색 결과가 없습니다.'
                                .text
                                .size(FontSize.subTitle)
                                .color(context.appColors.text)
                                .make(),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          _typeAheadController.text = suggestion.toString();
                          settingData.groupName = _typeAheadController.text;
                          settingData.isGroup = true;
                          settingData.isGroupChanged = true;
                        }),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      height: 60,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          fillColor: context.appColors.boxFillColor,
                          filled: true,
                          labelText: '학년을 입력해주세요',
                          labelStyle: TextStyle(
                            color: context.appColors.text,
                            fontSize: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 52, 52, 71),
                              width: 2,
                            ),
                          ),
                        ),
                        child: DropdownButton(
                          value: settingData.groupDetail,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          style: TextStyle(color: context.appColors.text),
                          isExpanded: true,
                          dropdownColor: context.appColors.boxFillColor,
                          underline: Container(
                            height: 2,
                          ),
                          onChanged: (String? newValue) {
                            print(newValue);
                            settingData.groupDetail = newValue!;
                            settingData.isGroupChanged = true;
                          },
                          items: _generateDetailDropMenu(),
                        ),
                      ),
                    ),
                    const Height(60),
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
                        child: Text(
                          '회원탈퇴',
                          style: TextStyle(
                              color: context.appColors.subText,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _generateDetailDropMenu() {
    return settingData.groupName.isEmpty ||
            settingData.groupName.contains("초등학교")
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
        : ['1', '2', '3'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(fontSize: 20)),
            );
          }).toList();
  }

  _onUpdateProfile() async {
    settingData.isLoading = true;
    if (settingData.isName && settingData.isGroup) {
      _formKey.currentState!.save();

      final request = UpdateMyProfileRequest(
        isFile: settingData.isFile,
        file: settingData.image,
        name: settingData.isNameChanged ? settingData.userName : null,
        groupName:
            settingData.isGroupChanged ? _typeAheadController.text : null,
        groupDetail1: settingData.isGroupChanged ? settingData.groupDetail : null,
        isGroup: settingData.isGroupChanged,
      );

      Group updatedGroup = Get.find<GroupData>().myGroup.copyWith(request.groupName!, request.groupDetail1!);
      Get.find<GroupData>().myGroup = updatedGroup;

      userSimpleData
          .updateMyProfile(request)
          .then((value) => settingData.isLoading = false);

    } else if (!settingData.isName) {
      notification(context, '이름을 입력해주세요');
    } else if (!settingData.isGroup) {
      notification(context, '소속을 입력해주세요');
    }
  }

  _onLogout() {
    storage.delete(key: "accessToken");
    Get.offAllNamed('/login');
  }

  _onWithdrawal() {
    authenticationData.withdrawal().then((statusCode) {
      if (statusCode == 200) {
        clearGetXController();
        Get.offAllNamed('/');
      } else {
        notification(context, '죄송합니다. 다시 실행시켜주세요[$statusCode]');
      }
    });
  }

  void clearGetXController() {
    Get.find<AccessTokenData>().clear();
    Get.find<MyGroupsController>().clear();
    Get.find<MyProfileController>().clear();
    Get.find<MyFriendsController>().clear();
    Get.find<GameData>().clear();
  }

  Future getImageFromGallery() async {
    final status = await Permission.photos.request();
    if (status == PermissionStatus.granted) {
      await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 30)
          .then((image) {
        settingData.image = image;
        if (image == null) settingData.originImageName = null;
        settingData.isFile = true;
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
            backgroundColor: context.appColors.mainBackgroundColor,
            contentPadding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            actionsAlignment: MainAxisAlignment.spaceAround,
            title: SizedBox(
              height: 100,
              child: Column(
                children: [
                  Text(
                    '회원 탈퇴',
                    style:
                        TextStyle(color: context.appColors.text, fontSize: 23),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '회원탈퇴시 저장되어 있는 \n모든 데이터가 삭제됩니다',
                    style: TextStyle(
                        color: context.appColors.subText, fontSize: 15),
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
                  child: Text(
                    '취소',
                    style:
                        TextStyle(color: context.appColors.text, fontSize: 20),
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
