import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {

  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamza Javaid Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _displayValue = '';
  ContextModel _contextModel = ContextModel();

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        // Evaluate the expression
        try {
          final result = _evaluateExpression(_displayValue);
          _displayValue = result.toString();
        } catch (e) {
          _displayValue = 'Error';
        }
      } else if (buttonText == 'C') {
        // Clear the display value
        _displayValue = '';
      } else {
        _displayValue += buttonText;
      }
    });
  }

  double _evaluateExpression(String expression) {
    Parser parser = Parser();
    Expression exp = parser.parse(expression);


    return exp.evaluate(EvaluationType.REAL, _contextModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hamza Javaid Calculator App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[300],
            child: Text(
              _displayValue,
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Table(
            children: [
              TableRow(
                children: [
                  CalculatorButton(
                    text: '7',
                    onPressed: _onButtonPressed,
                  ),
                  CalculatorButton(
                    text: '8',
                    onPressed: _onButtonPressed,
                  ),
                  CalculatorButton(
                    text: '9',
                    onPressed: _onButtonPressed,
                  ),
                  CalculatorButton(
                    text: '/',
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
              TableRow(
                children: [
                  CalculatorButton(
                    text: '4',
                    onPressed: _onButtonPressed,
                  ),
                  CalculatorButton(
                    text: '5',
                    onPressed: _onButtonPressed,
                  ),
                  CalculatorButton(
                    text: '6',
                    onPressed: _onButtonPressed,
                  ),
                  CalculatorButton(
                    text: '*',
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
              TableRow(
                children: [
                  CalculatorButton(
                    text: '1',
                    onPressed: _onButtonPressed,
                  ),
                  CalculatorButton(
                    text: '2',
                    onPressed: _onButtonPressed,
                  ),
                  CalculatorButton(
                    text: '3',
                    onPressed: _onButtonPressed,
                  ),
                  CalculatorButton(
                    text: '-',
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
              TableRow(
                children: [
                  CalculatorButton(
                    text: '0',
                    onPressed: _onButtonPressed,
                  ),
                  CalculatorButton(
                    text: '.',
                    onPressed: _onButtonPressed,
                  ),
                  CalculatorButton(
                    text: '+',
                    onPressed: _onButtonPressed,
                  ),
                  SizedBox(), // Empty cell for equal button
                ],
              ),
              TableRow(
                children: [
                  CalculatorButton(
                    text: 'C',
                    onPressed: _onButtonPressed,
                  ),
                  SizedBox(), // Empty cell for clear button
                  SizedBox(), // Empty cell for multiplication button
                  CalculatorButton(
                    text: '=',
                    onPressed: _onButtonPressed,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function(String) onPressed;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => onPressed(text),
        child: Text(text),
      ),
    );
  }
}
