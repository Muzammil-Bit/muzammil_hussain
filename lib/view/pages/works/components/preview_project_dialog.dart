import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muzammil_hussain/extensions/context_ext.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../models/project.dart';
import '../../../router/routes.dart';

class PreviewProjectDialog extends StatelessWidget {
  const PreviewProjectDialog({super.key, required this.item});
  final Project item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          constraints: BoxConstraints(maxWidth: 1100, maxHeight: 800),
          padding: EdgeInsets.only(left: 30, right: 5, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                blurRadius: 14,
                spreadRadius: 8,
              ),
            ],
            color: Colors.black,
          ),
          // height: 800,
          width: double.maxFinite,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: CircleAvatar(
                        radius: context.isMobile ? 14 : null,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                        )),
                  ),
                  // AppButton(onTap: () {}),
                ],
              ),
              SizedBox(height: 15),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(bottom: 30, right: 25),
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontSize: context.isMobile ? 24 : 38,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Colors.white.withOpacity(0.5),
                      height: 20,
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Overview",
                      style: TextStyle(
                        fontSize: context.isMobile ? 18 : 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    // SizedBox(height: 5),
                    Text(
                      item.description,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: context.isMobile ? 14 : null),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Tech Stack",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    Divider(),
                    Container(
                      width: double.maxFinite,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        runAlignment: WrapAlignment.spaceBetween,
                        runSpacing: 20,
                        spacing: 60,
                        children: [
                          _tools(),
                          _platforms(),
                          if (item.features != null) _features(),
                          _stateManagement(),
                          _projectLinks(context),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 30),
                    Container(
                      width: double.maxFinite,
                      child: Text(
                        "Project Images",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white.withOpacity(0.4),
                    ),
                    SizedBox(height: 30),
                    GridView.builder(
                      itemBuilder: (context, index) => Container(
                        color: Colors.white,
                        child: Image.asset(
                          item.pngPaths[index],
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      itemCount: item.pngPaths.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: context.isTablet
                            ? 2
                            : context.isMobile
                                ? 1
                                : 3,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                        childAspectRatio: item.name ==
                                "Firmware for Rushabh Instruments LLC HISTOPRO 810 Slide Dryer"
                            ? 7.5 / 4.5
                            : 5 / 7.5,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _projectLinks(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.link_rounded, color: Colors.white),
              SizedBox(width: 10),
              Text(
                "Project Links",
                style: TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          if (item.links.isEmpty)
            InkWell(
              onTap: () {
                context.go(Routes.contact);
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "- Contact Me",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        )),
                    WidgetSpan(child: SizedBox(width: 5)),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(Icons.open_in_new, color: Colors.white),
                    ),
                  ],
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          for (int i = 0; i < item.links.length; i++) ...[
            InkWell(
              onTap: () async {
                if (await canLaunchUrlString(item.links[i])) {
                  await launchUrlString(item.links[i]);
                }
              },
              child: Text(
                "- ${item.links[i]}",
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  // fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 5),
          ]
        ],
      ),
    );
  }

  Widget _features() {
    return Container(
      constraints: BoxConstraints(minWidth: 400),
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Icon(
                Icons.build_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
            WidgetSpan(
              child: SizedBox(width: 10),
            ),
            TextSpan(
              text: "Features :",
            ),
            WidgetSpan(
              child: SizedBox(width: 16),
            ),
            TextSpan(
              text: item.features,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _stateManagement() {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 400),
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Icon(
                Icons.settings_input_composite_rounded,
                color: Colors.white,
              ),
            ),
            WidgetSpan(
              child: SizedBox(width: 10),
            ),
            TextSpan(
              text: "State Management :",
            ),
            WidgetSpan(
              child: SizedBox(width: 16),
            ),
            TextSpan(
              text: item.stateManagement,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _platforms() {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 400),
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Icon(
                Icons.laptop_chromebook,
                color: Colors.white,
              ),
            ),
            WidgetSpan(
              child: SizedBox(width: 10),
            ),
            TextSpan(
              text: "Available Platforms :",
            ),
            WidgetSpan(
              child: SizedBox(width: 16),
            ),
            TextSpan(
              text: item.availablePlatforms,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Text _tools() {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Icon(
              Icons.memory_rounded,
              color: Colors.white,
            ),
          ),
          WidgetSpan(
            child: SizedBox(width: 10),
          ),
          TextSpan(
            text: "Tools & Technologies :",
          ),
          WidgetSpan(
            child: SizedBox(width: 16),
          ),
          TextSpan(
            text: item.languageFramework,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }
}
