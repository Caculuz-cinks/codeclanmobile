import 'package:codeclanmobile/blocs/blocs.dart';
import 'package:codeclanmobile/common/custom_button.dart';
import 'package:codeclanmobile/common/custom_text_form_field.dart';
import 'package:codeclanmobile/screens/profile/profile_view.dart';
import 'package:codeclanmobile/services/api/models/user_dto.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileView extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  EditProfileView({this.email, this.firstName, this.lastName});
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _firstNameController = TextEditingController();

  final _secondNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _showPassword = false;
  UserDto userDto = UserDto();

  @override
  void initState() {
    _firstNameController.text = widget.firstName;
    _secondNameController.text = widget.lastName;
    _emailController.text = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: BlocBuilder<UserBloc, UserState>(
          builder: (BuildContext context, UserState state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text('Edit Profile',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: AppColors.buttonShade1,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                      )),
                  SpaceH36(),
                  CustomTextFormField(
                    controller: _firstNameController,
                    hasPrefixIcon: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    textInputType: TextInputType.text,
                    titleStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                    hasTitle: true,
                    title: '',
                    hintTextStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                  ),
                  SpaceH8(),
                  CustomTextFormField(
                    controller: _secondNameController,
                    hasPrefixIcon: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    textInputType: TextInputType.text,
                    titleStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                    hasTitle: true,
                    title: '',
                    hintTextStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                  ),
                  SpaceH8(),
                  CustomTextFormField(
                    controller: _emailController,
                    hasPrefixIcon: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    textInputType: TextInputType.text,
                    titleStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                    hasTitle: true,
                    title: '',
                    hintTextStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                  ),
                  SpaceH8(),
                  CustomTextFormField(
                    controller: _passwordController,
                    hasPrefixIcon: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    textInputType: TextInputType.text,
                    titleStyle: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(color: Color(0xFF666666), fontSize: 12),
                    ),
                    hasTitle: true,
                    title: '',
                    obscured: _showPassword,
                    hasSuffixIcon: true,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Icon(_showPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    hintTextStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                  ),
                  SpaceH96(),
                  CustomButton(
                      title: Text(
                        'Save',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15)),
                      ),
                      borderRadius: 3,
                      color: Colors.black87,
                      onPressed: state is! EditProfileLoading
                          ? () async {
                              BlocListener(listener: (context, state) {
                                userDto.firstName = _firstNameController.text;
                                userDto.lastName = _secondNameController.text;
                                userDto.email = _emailController.text;
                                BlocProvider.of<UserBloc>(context)
                                    .add(EditButtonPressed(userDto: userDto));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileView(),
                                  ),
                                );
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileView(),
                                ),
                              );
                            }
                          : () {}),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
