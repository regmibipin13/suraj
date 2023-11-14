import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controller/auth/login/login_controller.dart';
import 'package:user_app/utils/custom_text_style.dart';
import 'package:user_app/utils/validator.dart';
import 'package:user_app/widgets/custom/custom_password_fields.dart';
import 'package:user_app/widgets/custom/custom_textfield.dart';
import 'package:user_app/widgets/custom/elevated_button.dart';

class LogInScreen extends StatelessWidget {
  static const String routeName = "/login";
  LogInScreen({super.key});

  final c = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Get.height,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/common/images/bg.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: Get.width / 6,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height / 8,
                      ),
                      const Text(
                        "Welcome To Alwafiq",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(
                        height: Get.width / 6,
                      ),
                      Container(
                        width: Get.width / 1.1,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 21),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 246, 246, 246),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(4, 4),
                              blurRadius: 2,
                              spreadRadius: 1,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ],
                        ),
                        child: Form(
                          key: c.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Login",
                                style: CustomTextStyles.f32W600(),
                              ),
                              const SizedBox(
                                height: 28,
                              ),
                              CustomTextField(
                                controller: c.emailController,
                                hint: "Email",
                                validator: Validators.checkEmailField,
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Obx(
                                () => CustomPasswordField(
                                  hint: "Password",
                                  eye: c.passwordObscure.value,
                                  onEyeClick: c.onEyeCLick,
                                  controller: c.passwordController,
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomElevatedButton(
                                title: "Log In",
                                onTap: c.onSubmit,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
