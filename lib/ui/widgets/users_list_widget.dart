import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class UsersItemWidget extends StatelessWidget {
  const UsersItemWidget({
    Key? key,
    required this.urlProfile,
    required this.avatar,
    required this.username,
    required this.index,
  }) : super(key: key);
  final String urlProfile;
  final String avatar;
  final String username;
   final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(
            width: kToolbarHeight - 10,
            height: kToolbarHeight - 10,
          ),
          child: InkWell(
              onTap: () async {
                var url = urlProfile;

                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Image.network(avatar)),
        ),
        title: Text(
          index.toString()+ " "+username,
          maxLines: 1,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(18),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
