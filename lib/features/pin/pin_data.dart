import 'package:flutter/material.dart';

TextEditingController pinOneCtrlr = TextEditingController();
TextEditingController pinTwoCtrlr = TextEditingController();
TextEditingController pinThreeCtrlr = TextEditingController();
TextEditingController pinFourCtrlr = TextEditingController();
TextEditingController pinFiveCtrlr = TextEditingController();
TextEditingController pinSixCtrlr = TextEditingController();

List pinInputRowList = [
  _PinInputRowItem(1, pinOneCtrlr),
  _PinInputRowItem(2, pinTwoCtrlr),
  _PinInputRowItem(3, pinThreeCtrlr),
  _PinInputRowItem(4, pinFourCtrlr),
  _PinInputRowItem(5, pinFiveCtrlr),
  _PinInputRowItem(6, pinSixCtrlr),
];

class _PinInputRowItem {
  final int row;
  final TextEditingController inputCtrlr;

  _PinInputRowItem(this.row, this.inputCtrlr);
}
