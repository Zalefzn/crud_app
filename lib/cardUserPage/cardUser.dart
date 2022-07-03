import 'package:find_content_app/method/sizeScreen/sizeScreen.dart';
import 'package:find_content_app/method/theme/theme.dart';
import 'package:find_content_app/model/userModel.dart';
import 'package:flutter/material.dart';

class CardUser extends StatefulWidget {
  UserModel user;
  CardUser(this.user, {Key? key}) : super(key: key);

  @override
  State<CardUser> createState() => _CardUser();
}

class _CardUser extends State<CardUser> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        margin: EdgeInsets.only(top: SizeConfig.blockVertical * 3),
        height: SizeConfig.blockVertical * 10,
        width: SizeConfig.blockHorizontal * 100,
        decoration: BoxDecoration(
          color: backgroundColor3,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 2),
              height: SizeConfig.blockVertical * 8,
              width: SizeConfig.blockHorizontal * 16,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: NetworkImage(widget.user.picture),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: SizeConfig.blockHorizontal * 3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.title +
                      "  " +
                      widget.user.firstName +
                      " " +
                      widget.user.lastName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(widget.user.id,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600)),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit, color: Colors.blue)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete, color: Colors.red)),
                ],
              ),
            ),
          ],
        ));
  }
}
