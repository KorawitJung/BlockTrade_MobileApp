import 'package:blocktrade/all_sign_form/size_config.dart';
import 'package:blocktrade/all_sign_form/splash/splash_screen.dart';
import 'package:blocktrade/store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

final f1 = NumberFormat("#,##0.", "en_US");
final f2 = NumberFormat("#,##0.00", "en_US");

class Drawerpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * .6,
        child: Drawer(
          child: Column(
            //ListView(
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(1)),
                    padding: EdgeInsetsDirectional.all(
                        getProportionateScreenWidth(5)),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Text(
                            "",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFF687A86),
                                fontWeight: FontWeight.bold),
                          ),
                          //profile
                          Container(
                            child: ProfileRnd(
                              heightcam: 46,
                              widthcam: 46,
                              widthprofile: 200,
                              heightprofile: 200,
                              positioncamRight: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.005),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                width: 230,
                height: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Mr. Steve Krug",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.005),
                    //Email
                    Text(
                      "Email:",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Steve_Kr@gmail.com",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Phone number:",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //Phone number
                    SizedBox(height: 5),
                    Text(
                      "089-999-9999",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.005),
              Column(
                children: [
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: CreditBoxDecoration(),
                    child: CreditBox(sizeofCreditNumber: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

BoxDecoration CreditBoxDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    border: Border.all(width: 0.4, color: Colors.white),
    color: Color(0xFF687A86),
  );
}

class ProfileRnd extends StatelessWidget {
  final double heightprofile;
  final double widthprofile;
  final double heightcam;
  final double widthcam;
  final double positioncamRight;
  const ProfileRnd({
    Key? key,
    required this.heightprofile,
    required this.widthprofile,
    required this.heightcam,
    required this.widthcam,
    required this.positioncamRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightprofile,
      width: widthprofile,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
            backgroundColor: Colors.white,
          ),
          Positioned(
            right: positioncamRight,
            bottom: 0,
            child: SizedBox(
              height: heightcam,
              width: widthcam,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//CreditBox for Design Layout

// class CreditBox extends StatefulWidget {
//   final double sizeofCreditNumber;
//   const CreditBox({
//     Key? key,
//     required this.sizeofCreditNumber,
//   }) : super(key: key);

//   @override
//   _CreditBoxState createState() => _CreditBoxState();
// }

// class _CreditBoxState extends State<CreditBox> {
//   @override
//   Widget build(BuildContext context) {
//     Store store1 = Provider.of<Store>(context);

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           children: [
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(left: 15),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text(
//                           "Credit:",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           "3,000,000",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: widget.sizeofCreditNumber),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text(
//                   "last updated at 5 p.m.",
//                   style: TextStyle(color: Colors.white, fontSize: 12),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     print('refresh');
//                   },
//                   icon: Icon(Icons.restart_alt),
//                   color: Colors.white,
//                 ),
//               ],
//             )
//           ],
//         ),
//       ],
//     );
//   } //end of build function
// } //ec

class CreditBox extends StatefulWidget {
  final double sizeofCreditNumber;
  const CreditBox({
    Key? key,
    required this.sizeofCreditNumber,
  }) : super(key: key);

  @override
  _CreditBoxState createState() => _CreditBoxState();
}

class _CreditBoxState extends State<CreditBox> {
  @override
  Widget build(BuildContext context) {
    Store store1 = Provider.of<Store>(context);
    if (store1.balance_status == true) {
      if (store1.cash_balance == 'notfound') {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Credit:",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Account not found",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: widget.sizeofCreditNumber),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "last updated at 5 p.m.",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    IconButton(
                      onPressed: () {
                        print('refresh');
                      },
                      icon: Icon(Icons.restart_alt),
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Credit:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            f2
                                .format(
                                  double.parse(
                                    store1.cash_balance,
                                  ),
                                )
                                .toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: widget.sizeofCreditNumber),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "last updated at 5 p.m.",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  IconButton(
                    onPressed: () {
                      print('refresh');
                    },
                    icon: Icon(Icons.restart_alt),
                    color: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ],
      );
    } //end of if
    else {
      store1.checkBalance();
      return Center(
        child: CircularProgressIndicator(),
      );
    } //end of else
  } //end of build function
} //ec



