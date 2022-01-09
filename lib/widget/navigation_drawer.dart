import 'package:building_drawer/pages/go_screen.dart';
import 'package:building_drawer/pages/user_page.dart';
import 'package:building_drawer/pages/view_screen.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  final Color color = Colors.white;
  final String name = 'Michael Saum';
  final String email = 'MichaelMSaum@rhyta.com ';
  final String urlImage =
      'https://images.unsplash.com/photo-1641673503830-5427a8679af6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xff0067B0),
        child: ListView(
          children: [
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => new UserPage(
                    name: name,
                    urlImage: urlImage,
                  ),
                ),
              ),
            ),
            buildSearchFieldItem(),
            SizedBox(
              height: 48,
            ),
            buildMenuItem(
              text: 'People',
              icon: Icons.people,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Favourites',
              icon: Icons.favorite_border,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Workflow',
              icon: Icons.workspaces_outline,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Updates',
              icon: Icons.update,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(
              height: 16,
            ),
            Divider(
              height: 1.0,
              color: color,
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Plugin',
              icon: Icons.account_tree,
              onClicked: () => selectedItem(context, 4),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Notifications',
              icon: Icons.notification_important_sharp,
              onClicked: () => selectedItem(context, 5),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    return Container(
      padding: EdgeInsets.only(right: 16, left: 16),
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
          //size: 24,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: color,
            //fontSize: 24,
          ),
        ),
        onTap: onClicked,
      ),
    );
  }

  selectedItem(BuildContext context, int i) {
    Navigator.of(context).pop();
    switch (i) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => new ViewScreen(),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => new GoScreen(),
          ),
        );
        break;
      default:
    }
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(urlImage),
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  name,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: color, fontSize: 24),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  email,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: color, fontSize: 12),
                ),
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 24,
              child: Icon(Icons.add_comment_outlined, color: color),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSearchFieldItem() {
    final color = Colors.white;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        style: TextStyle(color: color),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          hintText: 'Search',
          hintStyle: TextStyle(color: color),
          prefixIcon: Icon(Icons.search, color: color),
          filled: true,
          fillColor: Colors.white12,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: color.withOpacity(.7),
            ),
          ),
        ),
      ),
    );
  }
}
