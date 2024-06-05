import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "BMI Calculator")
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _bmi = 0.0;
  String category = "";
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();


  void _calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 0.0;
    double weight = double.tryParse(_weightController.text) ?? 0.0;

    if (height > 0 && weight > 0) {
      double bmi = weight / ((height / 100 ) * (height / 100));
      setState(() {
        _bmi = bmi;
      });
    }
    if (_bmi <= 18.5) {
      category = "Underweight";
    } else if (_bmi <= 24.9) {
      category = "Normal";
    } else if (_bmi <= 29.9) {
      category = "Overweight";
    } else {
      category = "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title)),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1149608670.
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height (cm)'
            ),
            controller: _heightController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)'
            ),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1722974645.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1018411110.
            controller: _weightController,
            ),
            Text(
              'Your BMI is: ${_bmi.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineSmall
            ),
            Text(
              category,
              style: Theme.of(context).textTheme.headlineSmall
            ),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: const Text('Calculate BMI'),
            ),
          ],
        ),
        )
    );
  }
}