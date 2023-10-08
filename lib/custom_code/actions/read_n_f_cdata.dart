// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:nfc_manager/nfc_manager.dart';
import 'dart:async';

Future<String?> readNFCdata() async {
  bool isAvailable = await NfcManager.instance.isAvailable();

  if (isAvailable) {
    try {
      Ndef? ndef;
      // Start session
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        ndef = Ndef.from(tag);
      });

      if (ndef == null) {
        throw Exception("NDEF is not supported on this device");
      }

      if (ndef != null) {
        NdefMessage message = await ndef!.read();
        String data = String.fromCharCodes(message.records[0].payload);

        // End session
        await NfcManager.instance.stopSession();

        // Return data
        return data;
      }
    } catch (e) {
      // Handle any exceptions and return an error message
      return "Error reading NFC data: $e";
    }
  } else {
    return "NFC not available on this device";
  }

  throw Exception("Unreachable code, this should not happen");
}
