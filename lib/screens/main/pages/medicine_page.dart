import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/uitls/colors.dart';

class MedicinePage extends StatefulWidget {
  const MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Medicine shop",
          style: GoogleFonts.poppins(fontSize: 18, color: appColor),
        ),
        actions: [Image.asset("assets/shop.png")],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/banner.png"),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: _searchController,
                style: GoogleFonts.plusJakartaSans(color: black),
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: textColor,
                    ),
                    fillColor: white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor)),
                    hintText: "Search by Product name or Category",
                    hintStyle: GoogleFonts.plusJakartaSans(
                        color: black, fontSize: 12)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: GoogleFonts.poppins(
                        color: appColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: GoogleFonts.poppins(color: mainColor),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 162,
                      decoration: BoxDecoration(
                        color: Color(0xffF0E2D9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Prescribed \n Medicine",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: cateColor, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 80,
                      width: 162,
                      decoration: BoxDecoration(
                        color: Color(0xffD5E5DA),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Herbal \n Medicine",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: cateColor, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 80,
                      width: 162,
                      decoration: BoxDecoration(
                        color: Color(0xffF4DCDC),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Baby \n Care",
                          style: GoogleFonts.poppins(
                              color: cateColor, fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 8, right: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 162,
                      decoration: BoxDecoration(
                        color: Color(0xffF4EAF3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Equipments",
                          style: GoogleFonts.poppins(
                              color: cateColor, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 80,
                      width: 162,
                      decoration: BoxDecoration(
                        color: Color(0xffF4EAF3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Sexual \n Wellness",
                          style: GoogleFonts.poppins(
                              color: cateColor, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 80,
                      width: 162,
                      decoration: BoxDecoration(
                        color: Color(0xffEDEFEA),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Skin \n Care",
                          style: GoogleFonts.poppins(
                              color: cateColor, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Prescribed Medicine",
                    style: GoogleFonts.poppins(
                        color: appColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: GoogleFonts.poppins(color: mainColor),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 236,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 140,
                            child: Stack(
                              children: [
                                Image.asset("assets/newlogo.png"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.favorite_outline),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 4.0, top: 8, right: 4),
                            child: Text(
                              "Pantonix Tablet 20mg",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: appColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0, right: 4),
                            child: Text(
                              "10 tablets",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: textColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0, right: 4),
                            child: Text(
                              "10.99\$",
                              style: GoogleFonts.poppins(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                  color: textColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 4.0, right: 4, bottom: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "8.99\$",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: appColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                      alignment: Alignment.topLeft,
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          color: mainColor,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Icon(
                                        Icons.add,
                                        color: white,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Skin & Hair Care",
                    style: GoogleFonts.poppins(
                        color: appColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: GoogleFonts.poppins(color: mainColor),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 236,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 140,
                            child: Stack(
                              children: [
                                Image.asset("assets/newlogo.png"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.favorite_outline),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 4.0, top: 8, right: 4),
                            child: Text(
                              "Pantonix Tablet 20mg",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: appColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0, right: 4),
                            child: Text(
                              "10 tablets",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: textColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0, right: 4),
                            child: Text(
                              "10.99\$",
                              style: GoogleFonts.poppins(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                  color: textColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 4.0, right: 4, bottom: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "8.99\$",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: appColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: Container(
                                      alignment: Alignment.topLeft,
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          color: mainColor,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Icon(
                                        Icons.add,
                                        color: white,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
