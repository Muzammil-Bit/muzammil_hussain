import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

import '../../../config/constants.dart';
import '../../../extensions/context_ext.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/nav_bar.dart';
import '../../widgets/section_title.dart';
import '../home/views/footer_view.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AnimatedNavWrapper(
            child: Container(
              padding: EdgeInsets.only(top: 200),
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
                maxHeight: context.isMobile || context.isTablet
                    ? double.infinity
                    : 1600,
              ),
              child: Column(
                children: [
                  SectionTitle(
                    backgroundText: "Contact",
                    foreGroundText: "READY TO GET\nCONVERSATION STARTED?",
                    subTitle: "GOOD IDEA!",
                  ),
                  SizedBox(height: 120),
                  context.isMobile || context.isTablet
                      ? _mobileView(context)
                      : _desktopView(context),
                  FooterView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _mobileView(BuildContext context) {
    return Column(
      children: [
        _contactForm(context),
        SizedBox(height: 100),
        _contactInformation(context),
      ],
    );
  }

  Widget _contactInformation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
        top: 70,
        bottom: 150,
      ),
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
            text: "I'd Love To Hear From You ",
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.aboveBaseline,
                baseline: TextBaseline.ideographic,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: CircleAvatar(
                    radius: 5,
                  ),
                ),
              )
            ],
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontFamily: "Raleway"),
          )),
          SizedBox(height: 50),
          ListTile(
            onTap: () async {
              await Clipboard.setData(
                  ClipboardData(text: Constants.phoneNumber));
              context.showToast("Phone number copied to your clipboard!");
            },
            leading: CircleAvatar(
              child: Icon(Icons.phone, color: Colors.white),
              radius: 25,
            ),
            minLeadingWidth: 60,
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            title: Text(
              'WHATSAPP',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: Colors.black),
            ),
            subtitle: Text(
              Constants.phoneNumber,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: "Raleway",
              ),
            ),
          ),
          Divider(height: 40),
          ListTile(
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: Constants.email));
              context.showToast("Email copied to your clipboard!");
            },
            minLeadingWidth: 60,
            leading: CircleAvatar(
              child: Icon(Icons.email, color: Colors.white),
              radius: 25,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            title: Text(
              'EMAIL',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: Colors.black),
            ),
            subtitle: Text(
              Constants.email,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: "Raleway",
              ),
            ),
          ),
          Divider(height: 40),
          ListTile(
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: Constants.email));
              context.showToast("Address copied to your clipboard!");
            },
            minLeadingWidth: 60,
            leading: CircleAvatar(
              child: Icon(Icons.email, color: Colors.white),
              radius: 25,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            title: Text(
              'ADDRESS',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: Colors.black),
            ),
            subtitle: Text(
              Constants.address,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: "Raleway",
              ),
            ),
          ),
        ],
      ),
    );
  }

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _commentEditingController =
      TextEditingController();
  Widget _contactForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          AppTextField(
            label: "What's your Full name?",
            controller: _nameEditingController,
          ),
          SizedBox(height: 25),
          AppTextField(
            label: "What's your email address?",
            controller: _emailEditingController,
          ),
          SizedBox(height: 25),
          AppTextField(
            label: "What's on your mind?",
            maxLines: 20,
            controller: _commentEditingController,
          ),
          SizedBox(height: 30),
          Container(
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () async {
                if (_nameEditingController.text.trim().isEmpty) {
                  context.showToast("Please enter your name.");
                  return;
                }
                if (_emailEditingController.text.trim().isEmpty) {
                  context.showToast("Please enter your email address.");
                  return;
                }
                if (_commentEditingController.text.trim().isEmpty) {
                  context
                      .showToast("Please enter something about what you need.");
                  return;
                }

                final MailOptions mailOptions = MailOptions(
                  body: _commentEditingController.text.trim(),
                  subject:
                      '${_nameEditingController.text.trim()} from portfolio website',
                  recipients: [Constants.email],
                  isHTML: true,
                );

                await FlutterMailer.send(mailOptions);
                context.showToast(
                    "Thank you for contacting me. For faster response please hit me up on Whatsapp!");
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.resolveWith(
                    (states) => Size(double.maxFinite, 60)),
                shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Theme.of(context).colorScheme.secondary),
              ),
              child: Text(
                "Let's Go",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _desktopView(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: _contactForm(context),
          ),
          Expanded(
            child: _contactInformation(context),
          ),
        ],
      ),
    );
  }
}
