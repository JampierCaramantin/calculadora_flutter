import 'package:calculadora/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalApp());
}

class CalApp extends StatefulWidget {
  const CalApp({super.key});

  @override
  State<CalApp> createState() => _CalAppState();
}

class _CalAppState extends State<CalApp> {
  String _history = "";
  String _expression = "";

  void clear(String text) {
    setState(() {
      _expression = "";
    });
  }

  void allClear(String text) {
    setState(() {
      _history = "";
      _expression = "";
    });
  }

  void evaluate(String text) {
    //Parser p = Parser();
    GrammarParser p = GrammarParser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: Scaffold(
        backgroundColor: const Color(0xFF21252B),
        body: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                //color: Colors.blue,
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF545F61),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    bgcolor: 0xFF00BF45,
                    callback: allClear,
                    text: "AC",
                    textSize: 20.0,
                  ),
                  CalcButton(
                    bgcolor: 0xFFE3303A,
                    callback: clear,
                    text: "C",
                    textSize: 20.0,
                  ),
                  CalcButton(callback: numClick, text: "%", textSize: 20.0),
                  CalcButton(callback: numClick, text: "/", textSize: 20.0),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(callback: numClick, text: "7", textSize: 20.0),
                  CalcButton(callback: numClick, text: "8", textSize: 20.0),
                  CalcButton(callback: numClick, text: "9", textSize: 20.0),
                  CalcButton(callback: numClick, text: "*", textSize: 20.0),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(callback: numClick, text: "4", textSize: 20.0),
                  CalcButton(callback: numClick, text: "5", textSize: 20.0),
                  CalcButton(callback: numClick, text: "6", textSize: 20.0),
                  CalcButton(callback: numClick, text: "-", textSize: 20.0),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(callback: numClick, text: "1", textSize: 20.0),
                  CalcButton(callback: numClick, text: "2", textSize: 20.0),
                  CalcButton(callback: numClick, text: "3", textSize: 20.0),
                  CalcButton(callback: numClick, text: "+", textSize: 20.0),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(callback: numClick, text: ".", textSize: 20.0),
                  CalcButton(callback: numClick, text: "0", textSize: 20.0),
                  CalcButton(callback: numClick, text: "00", textSize: 20.0),
                  CalcButton(
                    bgcolor: 0xFF00BF45,
                    callback: evaluate,
                    text: "=",
                    textSize: 20.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
