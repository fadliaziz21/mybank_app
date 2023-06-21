import 'package:flutter/material.dart';

TextEditingController pinOneCtrlr = TextEditingController();
TextEditingController pinTwoCtrlr = TextEditingController();
TextEditingController pinThreeCtrlr = TextEditingController();
TextEditingController pinFourCtrlr = TextEditingController();
TextEditingController pinFiveCtrlr = TextEditingController();
TextEditingController pinSixCtrlr = TextEditingController();

List pinInputRowList = [
  _PinInputRowList(1, pinOneCtrlr),
  _PinInputRowList(2, pinTwoCtrlr),
  _PinInputRowList(3, pinThreeCtrlr),
  _PinInputRowList(4, pinFourCtrlr),
  _PinInputRowList(5, pinFiveCtrlr),
  _PinInputRowList(6, pinSixCtrlr),
];

class _PinInputRowList {
  final int row;
  final TextEditingController inputCtrlr;

  _PinInputRowList(this.row, this.inputCtrlr);
}
