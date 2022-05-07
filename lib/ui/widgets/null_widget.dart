import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NullWidget extends StatelessWidget {
  const NullWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - (kToolbarHeight * 2),
      width: MediaQuery.of(context).size.width - 48,
      child: Center(
        child: Text(
          'No Data, please search something else...',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
