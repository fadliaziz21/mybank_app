import 'package:flutter/material.dart';
import 'package:mybank_app/features/pin/models/pin_models.dart';

TextEditingController pinOneCtrlr = TextEditingController();
TextEditingController pinTwoCtrlr = TextEditingController();
TextEditingController pinThreeCtrlr = TextEditingController();
TextEditingController pinFourCtrlr = TextEditingController();
TextEditingController pinFiveCtrlr = TextEditingController();
TextEditingController pinSixCtrlr = TextEditingController();

List pinInputRowList = [
  PinInputRowItem(1, pinOneCtrlr),
  PinInputRowItem(2, pinTwoCtrlr),
  PinInputRowItem(3, pinThreeCtrlr),
  PinInputRowItem(4, pinFourCtrlr),
  PinInputRowItem(5, pinFiveCtrlr),
  PinInputRowItem(6, pinSixCtrlr),
];
