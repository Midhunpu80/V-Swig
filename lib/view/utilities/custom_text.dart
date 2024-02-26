import 'package:flutter/material.dart';

all_text({
  required var txt,
  required Color col,
  required double siz,
  required var wei,
  required var max
}) {
  return Text(txt,
      style: TextStyle(fontSize: siz, fontWeight: wei, color: col),maxLines: max,);
}
