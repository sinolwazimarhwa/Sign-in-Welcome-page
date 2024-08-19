import 'package:flutter/material.dart';
import 'newScreen.dart';  // Ensure the correct import path

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  var isVisible = false;
  String userSelectedRadio = '';
  bool agreedConditions = false;
  DateTime userSelectedDate = DateTime.now();
  double userValue = 0.0;
  var userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'Images/bg12.jpg',
              fit: BoxFit.cover, // Ensures the image covers the entire screen
            ),
          ),
          // Centered Container with Gradient
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [
                    Colors.orange,
                    Colors.green,
                    Colors.blue,
                  ],
                ),
              ),
              height: 500,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Times",
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: userController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              userController.clear();
                            });
                          },
                          icon: const Icon(Icons.clear)
                        ),
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Enter your name',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      obscureText: isVisible,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: isVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        hintText: 'Enter your password',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Male',
                          groupValue: userSelectedRadio,
                          onChanged: (value) {
                            setState(() {
                              userSelectedRadio = value!;
                            });
                          },
                        ),
                        const Text('MALE'),
                        Radio<String>(
                          value: 'Female',
                          groupValue: userSelectedRadio,
                          onChanged: (value) {
                            setState(() {
                              userSelectedRadio = value!;
                            });
                          },
                        ),
                        const Text('FEMALE')
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: agreedConditions,
                            onChanged: (value) {
                              setState(() {
                                agreedConditions = value!;
                              });
                            }),
                        const Text('I accept the Terms and Conditions'),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Enter your birthday'),
                        IconButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030),
                            ).then((value) {
                              if (value != null) {
                                setState(() {
                                  userSelectedDate = value;
                                });
                              }
                            });
                          },
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                    Slider(
                      min: 0.0,
                      max: 10.0,
                      divisions: 10,
                      value: userValue,
                      onChanged: (value) {
                        setState(() {
                          userValue = value;
                        });
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Confirmation!'),
                                  content: const Text('Are you sure?'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Close the dialog
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NewScreen(username:userController.text,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text('Yes'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('No'),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: const Text('SIGN UP')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

