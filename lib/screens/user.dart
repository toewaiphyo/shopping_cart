import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/provider/dark_theme_provider.dart';
import 'package:shopping_cart/screens/wishlist.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/Users';
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  var top = 0.0;
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange=Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                elevation: 0,
                centerTitle: true,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    top = constraints.biggest.height;

                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.red, Colors.blue],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: FlexibleSpaceBar(
                        centerTitle: true,
                        title: AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: top <= 110.0 ? 1 : 0,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 12,
                              ),
                              Container(
                                width: kToolbarHeight / 1.8,
                                height: kToolbarHeight / 1.8,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 1.0),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Toe Wai Phyo',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        background: Image(
                          image: NetworkImage(
                              "https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Title(title: "User Bag")),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    InkWell(

                      splashColor: Colors.red,
                      child: ListTile(
                        onTap: (){Navigator.of(context).pushNamed(WishListScreen.routeName);},
                        title: Text("Wishlist"),
                        trailing: Icon(Icons.chevron_right_rounded),
                        leading: Icon(Icons.tab),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text('Cart'),
                      trailing: Icon(Icons.chevron_right_rounded),
                      leading: Icon(Icons.shopping_cart),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text('My Orders'),
                      trailing: Icon(Icons.chevron_right_rounded),
                      leading: Icon(Icons.shopping_bag),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Title(title: "User Information")),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    UserListTile(
                      title: "Email",
                      subtitle: "email",
                      icon: Icons.email,
                      onTap: () {},
                    ),
                    UserListTile(
                      title: "Phone No",
                      subtitle: "555",
                      icon: Icons.phone,
                      onTap: () {},
                    ),
                    UserListTile(
                      title: "Shipping address",
                      subtitle: "address",
                      icon: Icons.local_shipping,
                      onTap: () {},
                    ),
                    UserListTile(
                      title: "Joined date",
                      subtitle: "date",
                      icon: Icons.watch_later,
                      onTap: () {},
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Title(title: "User Setting")),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    ListTileSwitch(
                      value: themeChange.darkTheme,
                      leading: Icon(Icons.wb_sunny),
                      title: Text("Dark mode"),
                      switchType: SwitchType.cupertino,
                      switchActiveColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          themeChange.darkTheme = value;
                        });
                      },
                      visualDensity: VisualDensity.comfortable,
                    ),
                    InkWell(
                      splashColor: Colors.red,
                      child: ListTile(
                        onTap: () async {
                          showDialog(

                              context: context,
                              builder: (BuildContext ctx) {
                                return AlertDialog(
                                  title: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8.0),
                                        child: Image.network(
                                          'https://image.flaticon.com/icons/png/128/1828/1828304.png',
                                          height: 20,
                                          width: 20,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text('Sign out'),
                                      )
                                    ],
                                  ),
                                  content: Text(
                                      "Do you really want to Sign out?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancel')),
                                    TextButton(
                                        onPressed: () async {},
                                        child: Text(
                                          'Ok',
                                          style: TextStyle(color: Colors.red),
                                        ))
                                  ],
                                );
                              });
                        },
                        title: Text('Logout'),
                        leading: Icon(Icons.exit_to_app),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          _buildFab()
        ],
      ),
    );
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down

        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down

        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()
          ..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String title;

  const Title({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ));
  }
}

class UserListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const UserListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme
          .of(context)
          .splashColor,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(icon),
        onTap: onTap,
      ),
    );
  }
}
