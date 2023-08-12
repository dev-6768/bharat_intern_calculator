import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
    });
  }

  @override

  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().build(context),
      body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network("https://d20x1nptavktw0.cloudfront.net/wordpress_media/2022/04/Blog-Image-64.jpg").image,
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Center(
              child: TitleTextWidget("Calculator"),
            ),
            
            CardWidget(
              CalculationTextEditingWidget(textController)
            ),

            SizedBox(height: 10),
            
            CardWidget(
              IntrinsicHeight(child: KeypadWidget(textController)),
            ),
          ],
        ),
      ),
      ),
    );
  }
}