import 'package:find_content_app/cardUserPage/cardUser.dart';
import 'package:find_content_app/method/sizeScreen/sizeScreen.dart';
import 'package:find_content_app/method/theme/theme.dart';
import 'package:find_content_app/provider/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    getDataUsers();
    super.initState();
  }

  getDataUsers() async {
    await Provider.of<UserProviders>(context, listen: false).getUsers();
  }

  @override
  Widget build(BuildContext context) {
    UserProviders user = Provider.of<UserProviders>(context);
    Widget contentHeaders() {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Find Another\nUser Here...',
                style: TextStyle(
                  color: textColor2,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                )),
            Container(
                height: SizeConfig.blockVertical * 4,
                width: SizeConfig.blockHorizontal * 45,
                decoration: BoxDecoration(
                  color: backgroundColor3,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField()),
          ],
        ),
      );
    }

    Widget contentHeaders2() {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('all users :',
                style: TextStyle(
                    color: textColor2,
                    fontSize: 17,
                    fontWeight: FontWeight.w500)),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_circle_rounded,
                  color: Colors.green,
                  size: 30,
                ))
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        height: SizeConfig.blockVertical * 62,
        width: SizeConfig.blockHorizontal * 90,
        decoration: BoxDecoration(
          color: backgroundColor2,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: user.users.map((user) => CardUser(user)).toList(),
          ),
        ),
      );
    }

    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor2,
        body: Column(
          children: [
            SizedBox(height: SizeConfig.blockVertical * 7),
            contentHeaders(),
            contentHeaders2(),
            content(),
          ],
        ),
      ),
    );
  }
}
