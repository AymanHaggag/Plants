// Flutter imports:
import 'package:flutter/material.dart';

// Packages imports:
import 'package:google_fonts/google_fonts.dart';

// project imports:
import 'package:green/constants/constants.dart';
import 'package:green/tools/storage/local/cashe_helper.dart';
import 'package:green/widgets/text_form_field.dart';
import 'package:green/widgets/toast.dart';
import '../screens/faqs/faqs_screen.dart';
import '../screens/saved/saved_screen.dart';
import '../screens/sign_in/cubit/user_cubit.dart';
import '../screens/sign_in/sign_in_screen.dart';
import '../screens/updates/updates_screen.dart';


class Drawer extends StatelessWidget {
   Drawer({super.key});

  final TextEditingController confirmDeletePasswordController = TextEditingController();
  final TextEditingController confirmDeleteEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor.withOpacity(.7),
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        const Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CircleAvatar(
                radius: 78,
                backgroundColor: Colors.green,
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage(
                    "assets/images/user_avatar/couple_Avatar.jpg",
                  ),
                ),
              ),
            ]),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
                "Hello Ayman!",
                style: GoogleFonts.autourOne(
                    textStyle: const TextStyle(fontSize: 25)),
              )),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            size: 30,
          ),
          title: Text(
            "Home",
            style: GoogleFonts.autourOne(
                textStyle: const TextStyle(fontSize: 20)),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.bookmark_border_outlined,
            size: 30,
          ),
          title: Text(
            "Saved",
            style: GoogleFonts.autourOne(
                textStyle: const TextStyle(fontSize: 20)),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SavedScreen()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.update,
            size: 30,
          ),
          title: Text(
            "Updates",
            style: GoogleFonts.autourOne(
                textStyle: const TextStyle(fontSize: 20)),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UpdatesScreen()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.question_mark_outlined,
            size: 30,
          ),
          title: Text(
            "FAQs",
            style: GoogleFonts.autourOne(
                textStyle: const TextStyle(fontSize: 20)),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FAQsScreen()));
          },
        ),
        const Divider(
          color: Colors.grey,
        ),
        ExpansionTile(
          title: Text(
            "Account",
            style: GoogleFonts.autourOne(
                textStyle: const TextStyle(fontSize: 20)),
          ),
          iconColor: Colors.green,
          textColor: Colors.green,
          children: [
            ListTile(
              leading: const Icon(
                Icons.logout,
                size: 30,
              ),
              title: Text(
                "Log Out",
                style: GoogleFonts.autourOne(
                    textStyle: const TextStyle(fontSize: 20)),
              ),
              onTap: () {
                CacheHelper.deleteData(key: "uId").then((value) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()),
                          (route) => false);
                  showToast("logout successful", ToastStates.success);
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.delete_forever_outlined,
                size: 30,
              ),
              title: Text(
                "Delete Account",
                style: GoogleFonts.autourOne(
                    textStyle: const TextStyle(fontSize: 20)),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: mainColor,
                      title: Text(
                        "Are you sure you want to delete your account?",
                        style: GoogleFonts.autourOne(
                            textStyle:
                            const TextStyle(fontSize: 20)),
                      ),
                      content: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  textColor),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "No",
                                style: GoogleFonts.autourOne(
                                    textStyle: const TextStyle(
                                        fontSize: 20)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        AlertDialog(
                                          backgroundColor:
                                          mainColor,
                                          title: Text(
                                            "Enter your password",
                                            style: GoogleFonts.autourOne(
                                                textStyle:
                                                const TextStyle(
                                                    fontSize:
                                                    20)),
                                          ),
                                          content: Column(
                                            mainAxisSize:
                                            MainAxisSize.min,
                                            children: [
                                              AppTextFormField(
                                                controller:
                                                confirmDeleteEmailController,
                                              ),
                                              AppTextFormField(
                                                controller:
                                                confirmDeletePasswordController,
                                                isPassword: true,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              SizedBox(
                                                width:
                                                double.infinity,
                                                child:
                                                ElevatedButton(
                                                  onPressed: () {
                                                    UserCubit.get(
                                                        context)
                                                        .deleteAccount(
                                                        confirmDeleteEmailController
                                                            .text,
                                                        confirmDeletePasswordController
                                                            .text)
                                                        .then(
                                                            (value) {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      LoginScreen()));
                                                        });
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                      textColor),
                                                  child: Text(
                                                    "Delete",
                                                    style: GoogleFonts
                                                        .autourOne(
                                                        textStyle:
                                                        const TextStyle(
                                                          fontSize: 20,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  textColor),
                              child: Text(
                                "Yes",
                                style: GoogleFonts.autourOne(
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ],
        ),
        const Spacer(),
        Center(
          child: Text(
            "Powered by Ayman Haggag©",
            style: GoogleFonts.autourOne(
                textStyle: const TextStyle(fontSize: 10)),
          ),
        )
      ],
    );
  }
}
