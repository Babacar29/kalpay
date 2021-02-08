import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalpay/screens/Modal_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin{
  TabController _tabController;
  bool isVisible = false;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final paiementData = [
      {
        "title": "Electricite",
        "image": "images/LOGO-senelec-HD.png"
      },
      {
        "title": "Eau",
        "image": "images/logo_seneau.png"
      },
      {
        "title": "TV",
        "image": "images/Canal_logo_white_bg.png"
      },
      {
        "title": "Autoroute",
        "image": "images/rapido-senegal.png"
      },
    ];

    return LayoutBuilder(
      builder: (ctx, constrains) => Scaffold(
          backgroundColor: Colors.grey[300],
          body: DefaultTabController(
            length: 3,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: constrains.maxHeight/12,
                  backgroundColor: const Color(0xFF7C55AF),
                  pinned: true,
                  leading: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                        backgroundImage: AssetImage("images/babacar.jpg")
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.list, color: Colors.white, size: 30,),
                    )
                  ],
                  elevation: 3,
                  title: Transform(
                    transform: Matrix4.translationValues(-22, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bienvenue', style: GoogleFonts.arimo(fontSize: 10),),
                        Text("Babacar Diouf", style: GoogleFonts.arimo(fontSize: 12),)
                      ],
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        height: constrains.maxHeight/3.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF7C55AF),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.elliptical(
                                  constrains.maxHeight/3.2, constrains.maxWidth/28
                              )
                          ),
                        ),
                        child: Column(
                          children: [
                            Divider(height: 2, color: Colors.black12, indent: 15, endIndent: 15,),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                                            child: Text(
                                              "Voir mon solde actuel:",
                                              style: GoogleFonts.arimo(color: Colors.white, fontSize: 14),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          isVisible ? Text(
                                            "1 000 000 F cfa",
                                            style: GoogleFonts.arimo(color: Colors.white, fontSize: 20),
                                          ) : SizedBox(
                                            width: constrains.maxWidth/2.5,
                                            child: Text(
                                              "Tapez sur l'oeil pour voir votre solde",
                                              style: GoogleFonts.arimo(fontSize: 10, color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          SizedBox(width: constrains.maxWidth/50,),
                                          GestureDetector(
                                            onTap: () {
                                              if(!isVisible){
                                                setState(() {
                                                  isVisible = true;
                                                });

                                                showMaterialModalBottomSheet(
                                                    context: context,
                                                    useRootNavigator: true,
                                                    bounce: true,
                                                    //secondAnimation: AnimationController.unbounded(vsync: this, duration: Duration(seconds: 30)),
                                                    enableDrag: true,
                                                    backgroundColor: Colors.transparent,
                                                    builder: (context) => Modal_screen()
                                                  //buildWrap(),
                                                );
                                              }
                                              else{
                                                setState(() {
                                                  isVisible = false;
                                                });
                                              }
                                            },
                                            child: !isVisible ? Icon(
                                              Icons.remove_red_eye_outlined,
                                              color: Colors.white,
                                              size: 20,
                                            ) : Icon(
                                              Icons.visibility_off_outlined,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: constrains.maxHeight/18,
                                              width: constrains.maxWidth/1.9,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white
                                                  ),
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                              child: FlatButton(
                                                child: Text("Recharger mon compte", style: GoogleFonts.arimo(color: Colors.white, fontSize: 12),),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(width: constrains.maxWidth/60,),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage("images/phone_motion.jpg"),
                                        radius: 35,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Divider(height: 2, color: Colors.black12, indent: 15, endIndent: 15,),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0, right: 5, top: 5),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage("images/send_money.jpeg"),
                                          radius: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 2.0, left: 5),
                                          child: Text("Envoyer de l'argent",style: GoogleFonts.arimo(color: Colors.white, fontSize: 10),),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0, right: 5, top: 5),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage("images/ask_money.png"),
                                          radius: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 2.0, left: 5),
                                          child: Text("Demander un paiement",style: GoogleFonts.arimo(color: Colors.white, fontSize: 10),),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0, right: 5, top: 5),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage("images/retirer_cash.png"),
                                          radius: 20,
                                          backgroundColor: Colors.deepPurple[400],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 2.0, left: 5),
                                          child: Text("Retirer cash",style: GoogleFonts.arimo(color: Colors.white, fontSize: 10),),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0, top: 5),
                                        child: Text("Paiement de factures", style: GoogleFonts.arimo(fontSize: 14),),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: constrains.maxHeight/7.5,
                                    child: ListView.builder(
                                      itemCount: paiementData.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (ctx, int i) => Row(
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10.0, top: 5, right: 5),
                                                child: Container(
                                                  width: constrains.maxWidth/4,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(10),
                                                      boxShadow: [
                                                        BoxShadow (
                                                          color: Colors.grey,
                                                          spreadRadius: 1,
                                                          blurRadius: 2,
                                                          offset: Offset(2, 0), // changes position of shadow
                                                        )
                                                      ]
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                        child: Image.asset(
                                                          paiementData[i]["image"],
                                                          height: constrains.maxHeight/11,
                                                          width: constrains.maxWidth/8,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 2.0, right: 2, bottom: 4),
                                                        child: Text(paiementData[i]["title"], style: GoogleFonts.arimo(fontSize: 11),),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10, top: 8),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0, ),
                                        child: Text("Achat de credit", style: GoogleFonts.arimo(fontSize: 14),),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0, top: 5, right: 5),
                                            child: Container(
                                              width: constrains.maxWidth/4,
                                              height: constrains.maxHeight/9,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow (
                                                      color: Colors.grey,
                                                      spreadRadius: 1,
                                                      blurRadius: 2,
                                                      offset: Offset(2, 0), // changes position of shadow
                                                    )
                                                  ]
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                    child: Image.asset(
                                                      'images/logo-orange.jpg',
                                                      height: constrains.maxHeight/11,
                                                      width: constrains.maxWidth/8,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0, top: 5, right: 5),
                                            child: Container(
                                              width: constrains.maxWidth/4,
                                              height: constrains.maxHeight/9,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow (
                                                      color: Colors.grey,
                                                      spreadRadius: 1,
                                                      blurRadius: 2,
                                                      offset: Offset(2, 0), // changes position of shadow
                                                    )
                                                  ]
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                    child: Image.asset(
                                                      'images/Free_logo.png',
                                                      height: constrains.maxHeight/11,
                                                      width: constrains.maxWidth/8,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0, top: 5, right: 5),
                                            child: Container(
                                              width: constrains.maxWidth/4,
                                              height: constrains.maxHeight/9,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow (
                                                      color: Colors.grey,
                                                      spreadRadius: 1,
                                                      blurRadius: 2,
                                                      offset: Offset(2, 0), // changes position of shadow
                                                    )
                                                  ]
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                    child: Image.asset(
                                                      'images/logo_expresso.png',
                                                      height: constrains.maxHeight/11,
                                                      width: constrains.maxWidth/8,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0),
                                        child: Text("Autres services", style: GoogleFonts.arimo(fontSize: 14),),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0, top: 5, right: 5),
                                            child: Container(
                                              width: constrains.maxWidth/4,
                                              height: constrains.maxHeight/9,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow (
                                                      color: Colors.grey,
                                                      spreadRadius: 1,
                                                      blurRadius: 2,
                                                      offset: Offset(2, 0), // changes position of shadow
                                                    )
                                                  ]
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                    child: Image.asset(
                                                      'images/LOGO-WOYOFAL-011.png',
                                                      height: constrains.maxHeight/11,
                                                      width: constrains.maxWidth/8,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0, top: 5, right: 5),
                                            child: Container(
                                              width: constrains.maxWidth/4,
                                              height: constrains.maxHeight/9,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow (
                                                      color: Colors.grey,
                                                      spreadRadius: 1,
                                                      blurRadius: 2,
                                                      offset: Offset(2, 0), // changes position of shadow
                                                    )
                                                  ]
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                    child: Image.asset(
                                                      'images/excaf_logo.jpeg',
                                                      height: constrains.maxHeight/11,
                                                      width: constrains.maxWidth/8,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0, top: 5, right: 5),
                                            child: Container(
                                              width: constrains.maxWidth/4,
                                              height: constrains.maxHeight/9,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow (
                                                      color: Colors.grey,
                                                      spreadRadius: 1,
                                                      blurRadius: 2,
                                                      offset: Offset(2, 0), // changes position of shadow
                                                    )
                                                  ]
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                    child: Image.asset(
                                                      'images/Wari_logo.jpg',
                                                      height: constrains.maxHeight/11,
                                                      width: constrains.maxWidth/8,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ])
                )
              ],
            ),
          ),
        bottomNavigationBar: Container(
          height: constrains.maxHeight/10,
          color: Colors.white,
          child: TabBar(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.grey[400],
            tabs: [
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home_outlined, size: 30, color: Colors.grey[400]),
                    Spacer(),
                    Text("Accueil", style: GoogleFonts.arimo(fontSize: 11, color: Colors.grey[400]),)
                  ],
                ),
              ),
              Tab(
                child: Container(
                    width: MediaQuery.of(context).size.width/4,
                    height: MediaQuery.of(context).size.height/6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: ImageIcon(AssetImage("images/Groupe 1123@3x.png"), size: 50, color: const Color(0XFFA60024),))
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.history, size: 30, color: Colors.grey[400]),
                    Spacer(),
                    Text("Historique", style: GoogleFonts.arimo(fontSize: 11, color: Colors.grey[400]),)
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: FloatingActionButton(
            onPressed: null,
            backgroundColor: const Color(0xFF7C55AF),
            child: Icon(Icons.ad_units),
          ),
        ),
      ),
    );
  }
}
