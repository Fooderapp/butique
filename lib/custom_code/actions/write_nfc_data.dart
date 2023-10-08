// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

// Automatic FlutterFlow importsCustom action writeNfcData cannot be parsed.

import 'package:nfc_manager/nfc_manager.dart';

Future<bool> writeNfcData(String? inputdata) async {
  Completer<bool> completer = Completer<bool>();

  try {
    NfcManager nfcManager = NfcManager.instance;
    nfcManager.startSession(onDiscovered: (NfcTag tag) async {
      Ndef? ndef = Ndef.from(tag);
      if (ndef == null) {
        throw Exception('Tag is not NDEF formatted');
      }
      NdefRecord record = NdefRecord.createText(inputdata!);
      NdefMessage message = NdefMessage([record]);
      await ndef.write(message);
      await nfcManager.stopSession();
      completer.complete(true);
    });
  } catch (e) {
    print('Error: $e');
    completer.complete(false);
  }

  return completer.future;
}
