import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          // padding: EdgeInsets.zero,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileTopWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    ElementsWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    LogoutButton(),
                  ],
                ),
              ),
            ),
            // Spacer(),
            Center(
              child: Container(
                child: Image.asset(
                  'assets/images/female_doc.jpg',
                  scale: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ElementsWidget extends StatelessWidget {
  const ElementsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(10, 29, 29, 29),
            offset: Offset(0.0, 2.0),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          DrawerItem(
            icon: Icons.edit,
            title: 'Edit my profile',
            onDrawerItemTap: () {
            },
          ),
          SizedBox(
            height: 10,
            width: 230,
            child: Divider(color: Colors.grey.shade200, thickness: 1),
          ),
          DrawerItem(
            icon: Icons.qr_code_2_rounded,
            title: 'Sharing Dropili Profile'  ,
            onDrawerItemTap: () {
            },
          ),
          SizedBox(
            height: 10,
            width: 230,
            child: Divider(color: Colors.grey.shade200, thickness: 1),
          ),
          ChangeLanguageExpensionTile(),
          SizedBox(
            height: 10,
            width: 230,
            child: Divider(color: Colors.grey.shade200, thickness: 1),
          ),
          DrawerItem(
            icon: Icons.storefront_outlined,
            title: 'Work mode'  ,
            onDrawerItemTap: () {
            },
          ),
          SizedBox(
            height: 10,
            width: 230,
            child: Divider(color: Colors.grey.shade200, thickness: 1),
          ),
          DrawerItem(
            icon: Icons.info_outline_rounded,
            title: 'About Dropili'  ,
            onDrawerItemTap: () {
            },
          ),
        ],
      ),
    );
  }
}

class ChangeLanguageExpensionTile extends StatelessWidget {
  const ChangeLanguageExpensionTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.only(left: 20),
        collapsedIconColor: Colors.grey.shade300,
        title: Row(
          children: <Widget>[
            Icon(
              Icons.language_outlined,
              size: 28,
              color: Colors.blue,
            ),
            SizedBox(width: 20),
            Text(
              'Change Language'  ,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        children: [
          ListTile(
            dense: true,
            title: Text(
              'English',
              style: TextStyle(
                fontSize: 15,
                color:Colors.blue,
              ),
            ),
            onTap: () {
            },
          )

        ],
      ),
    );
  }
}

class ProfileTopWidget extends StatelessWidget {
  const ProfileTopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(10, 29, 29, 29),
              offset: Offset(0.0, 2.0),
              blurRadius: 5,
              spreadRadius: 0,
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My name is',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Show my profile'  ,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
              color: Colors.grey.shade300,
            )
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final onDrawerItemTap;
  const DrawerItem(
      {required this.icon, required this.title, this.onDrawerItemTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 28,
              color: Colors.blue,
            ),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
              color: Colors.grey.shade300,
            )
          ],
        ),
        onTap: onDrawerItemTap,
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // padding: EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(10, 29, 29, 29),
            offset: Offset(0.0, 2.0),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ListTile(
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.logout_rounded,
              size: 28,
              color: Colors.red.shade400,
            ),
            SizedBox(width: 10),
            Text(
              'Log out'  .toUpperCase(),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.red.shade400,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
              color: Colors.grey.shade300,
            )
          ],
        ),
        onTap: () {

        },
      ),
    );
  }
}
