import 'package:avatar_glow/avatar_glow.dart';
import 'package:easy_hire/widgets/SearchTextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SpeechToText _speech;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _speech = SpeechToText();
    _controller = new TextEditingController();
    isListening = ValueNotifier<bool>(_speech.isAvailable);
  }

  @override
  void dispose() {
    super.dispose();
    _speech.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isListening,
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 80,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Stack(
                children: [
                  SearchTextField(
                    controller: _controller,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          customBorder: CircleBorder(),
                          child: Container(
                            child: AvatarGlow(
                              animate: _speech.isListening,
                              glowColor: Theme.of(context).primaryColor,
                              endRadius: 26.0,
                              duration: const Duration(milliseconds: 1000),
                              repeatPauseDuration: const Duration(milliseconds: 100),
                              repeat: true,
                              child: Material(
                                shape: CircleBorder(),
                                color: _speech.isListening ? Colors.transparent : Colors.white,
                                child: Icon(
                                  _speech.isListening ? Icons.mic : Icons.mic_none,
                                  color: Color(0xFF252525),
                                ),
                              ),
                            ),
                          ),
                          onTap: _listen,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: Color(0xFFF4F4F4),
              centerTitle: true,
            ),
          );
        });
  }

  ValueNotifier<bool> isListening;

  void _listen() async {
    if (!_speech.isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => setState(() {print('onStatus: $val');}),
        onError: (val) => setState(() {print('onError: $val');}),
      );

      if (available) {
        _controller.text = "";
        setState(() {_speech.listen(
          localeId: Locale('en', 'US').countryCode,
          onResult: (val) => setState(() {
            _controller.text = val.recognizedWords;
            _controller.selection = TextSelection.collapsed(offset: _controller.text.length);
          }),
        );});

      }
    } else {
      setState(() {
        _speech.cancel();
      });
    }
  }
}
