import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  void login() async {
    isLoading.value = true;
    // Simulate a network call; replace with actual authentication logic
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
    // Navigate to home screen or show error
    if (email.value == "test@example.com" && password.value == "password") {
      Get.snackbar('Success', 'Logged in successfully');
      // Get.to(HomeScreen()); // Navigate to home screen
    } else {
      Get.snackbar('Error', 'Invalid credentials');
    }
  }
}

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) => controller.email.value = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) => controller.password.value = value,
            ),
            SizedBox(height: 20),
            Obx(
              () => controller.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: controller.login,
                      child: Text('Login'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
