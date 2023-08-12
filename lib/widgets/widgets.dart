import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eval_ex/expression.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Calculator",
        style: TextStyle(
          fontFamily: GoogleFonts.calligraffitti().fontFamily,
          fontSize: 16.0,
        ),
      ),

      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 113, 103, 223),
    );
  }
}

class CardWidget extends StatefulWidget {
  final Widget columnController;
  CardWidget(this.columnController);
  //const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState(columnController);
}

class _CardWidgetState extends State<CardWidget> {
  final Widget columnController;
  _CardWidgetState(this.columnController);

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 400,
    child: Card(
      clipBehavior: Clip.antiAlias,
      color: Color.fromARGB(255, 142, 69, 193),
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Align(
          alignment: Alignment.center,
          child: columnController
        ),
      ),

    ),
    );
  }
}

class CalculationTextEditingWidget extends StatelessWidget {
  final TextEditingController textController;
  CalculationTextEditingWidget(this.textController);
  // const CalculationTextEditingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Expression",
        labelText: "Expression",
        
      ),
      controller: textController,
      maxLines: null,
      enableSuggestions: true,
      autocorrect: true,
    );
  }
}



class KeypadWidget extends StatefulWidget {
  final TextEditingController textController;
  KeypadWidget(this.textController);
  //const KeypadWidget({super.key});

  @override
  State<KeypadWidget> createState() => _KeypadWidgetState(textController);
}

class _KeypadWidgetState extends State<KeypadWidget> {
  final TextEditingController textController;
  _KeypadWidgetState(this.textController);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
            child: ElevatedButton(
              onPressed: () {
                textController.text += '9';
              },  
              child: Text("9"),
            ),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                textController.text += '8';
              },  
              child: Text("8"),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                textController.text += '7';
              },  
              child: Text("7"),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                textController.text += "+";
              },  
              child: Text("+"),
            ),
          ],
        ),
        ),

        SizedBox(height: 10),

        IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                textController.text += '6';
              },  
              child: Text("6"),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                textController.text += '5';
              },  
              child: Text("5"),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                textController.text += '4';
              },  
              child: Text("4"),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                textController.text += "*";
              },  
              child: Text("x"),
            ),
          ],
        ),
        ),

        SizedBox(height: 10),

        IntrinsicHeight(
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                textController.text += '3';
              },  
              child: Text("3"),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                textController.text += '2';
              },  
              child: Text("2"),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                textController.text += '1';
              },  
              child: Text("1"),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                textController.text += "/";
              },  
              child: Text("/"),
            ),
          ],
        ),
        ),
        SizedBox(height: 10),

        IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                textController.text = textController.text.substring(0, textController.text.length - 1);
              },  
              child: Text("<-"),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                textController.text += '0';
              },  
              child: Text("0"),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                Expression exp = Expression(textController.text);
                textController.text = exp.eval().toString();
              },  
              child: Text("="),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                textController.text += '-';
              },  
              child: Text("-"),
            ),
          ],
        ),
        ),

        SizedBox(height: 10),

        IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                textController.text = "";
              },  
              child: Text("C"),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                textController.text += '(';
              },  
              child: Text("("),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                textController.text += ')';
              },  
              child: Text(")"),
            ),

            SizedBox(width: 5),

            ElevatedButton(
              onPressed: () {
                textController.text += '^';
              },  
              child: Text("^"),
            ),
          ],
        ),
        ),
      ],
    );
  }
}


class TitleTextWidget extends StatelessWidget {
  final String text;
  TitleTextWidget(this.text);
  //const TitleTextWidget({super.key});

//
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: GoogleFonts.calligraffitti().fontFamily,
        color: Colors.white,
        fontSize: 45.0,
      ),
    );
  }
}
