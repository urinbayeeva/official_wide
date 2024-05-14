import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:wide/core/screens/all.dart';
import 'package:image_picker/image_picker.dart';

class InsideChat extends StatefulWidget {
  const InsideChat({super.key});

  @override
  State<InsideChat> createState() => _InsideChatState();
}

class _InsideChatState extends State<InsideChat> {
  bool wantDelete = false;
  bool isTappedGarbage = false;
  bool isTappedTextField = false;
  bool isImage = true;
  File? image;

  final List<Message> _messages = [
    Message(text: 'Hello!', isMe: false, date: 'Yesterday'), // Example date
    Message(text: 'Hi there!', isMe: true, date: 'Yesterday'), // Example date
    Message(
        text: 'How are you doing?', isMe: false, date: 'Today'), // Example date
    Message(
        text: 'I\'m good, thanks!', isMe: true, date: 'Today'), // Example date
  ];

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _sendMessage() async {
    if (_textEditingController.text.isNotEmpty) {
      setState(() {
        _messages.add(Message(
            date: "today",
            text: _textEditingController.text,
            isMe: true,
            isImage: true));
        _textEditingController.clear();
      });
    } else {
      pickImage();
    }
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  int indexmsg = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Row(children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(AppImages.returnIcon)),
            const SizedBox(width: 20),
            const CircleAvatar(radius: 16, backgroundColor: Colors.grey),
            const SizedBox(width: 16),
            const Text("Topilov_1",
                style: TextStyle(
                    color: Color(0xFF1C1C1C),
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            const Spacer(),
            wantDelete
                ? GestureDetector(
                    onTap: () {
                      _messages.removeAt(0);
                    },
                    child: SvgPicture.asset("assets/icons/home/garbage.svg",
                        width: 24, height: 24),
                  )
                : const SizedBox.shrink()
          ]),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                width: 1,
                color: Color(0xFFEFEFEF),
              )))))),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 14,
                    left: wantDelete ? 0 : 24,
                    right: wantDelete ? 0 : 24,
                  ),
                  child: Align(
                    alignment: wantDelete && message.isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: message.isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        if (message.date != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                message.date,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        GestureDetector(
                          onLongPress: () {
                            Vibration.vibrate(duration: 50);
                            setState(() {
                              wantDelete = !wantDelete;
                              FocusScope.of(context).unfocus();
                            });
                          },
                          child: wantDelete && message.isMe
                              ? Align(
                                  alignment: wantDelete && message.isMe
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  child: Container(
                                    width: double.infinity,
                                    height: 38,
                                    color: const Color(0xFFF5DFDF),
                                    child: Stack(
                                      alignment: message.isMe
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                      children: [
                                        Positioned.fill(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 32,
                                            color: const Color(0xFFF5DFDF),
                                          ),
                                        ),
                                        Align(
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    width: 0.5,
                                                    color: message.isMe
                                                        ? const Color(
                                                            0xFFCFCFD0)
                                                        : const Color(
                                                            0xFFF9B021),
                                                  ),
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 14,
                                                        vertical: 2),
                                                child: Text(
                                                  message.text,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.c1c1c1c),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      width: 0.5,
                                      color: message.isMe
                                          ? const Color(0xFFCFCFD0)
                                          : const Color(0xFFF9B021),
                                    ),
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 2),
                                  child: message.isImage &&
                                          image != null &&
                                          message.isMe
                                      ? SizedBox(
                                          width: 288,
                                          height: 162,
                                          child: Image.file(image!,
                                              fit: BoxFit.contain),
                                        )
                                      : Text(
                                          message.text,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.c1c1c1c),
                                        ),
                                ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: AppColors.cefefef,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 68),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: 36,
                        child: TextField(
                          cursorColor: AppColors.c1a73e8,
                          keyboardType: TextInputType.text,
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(12),
                            hintText: 'Type a message...',
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFFF7F7F7),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFFF9B021),
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF7F7F7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: _sendMessage,
                    child: Image.asset(
                      "assets/icons/home/send_msg.png",
                      width: 26,
                      height: 26,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/icons/home/microphone.svg",
                      width: 20,
                      height: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;
  final bool isImage;
  final String date; // Add date property

  Message(
      {required this.text,
      required this.isMe,
      this.isImage = true,
      String? date})
      : date = date ?? '';
}
