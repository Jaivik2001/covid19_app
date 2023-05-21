import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../helpers/covid_api_helper.dart';
import '../model/covid_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  covidcontry() async {
    CovidData.covidData.fetchWorldData(contry: dropdownvalue);
  }

  @override
  void initState() {
    covidcontry();
    super.initState();
  }

  var items = [
    'USA',
    'India',
    'France',
    'Brazil',
    'Germany',
    'UK',
    'Italy',
    'S. Korea',
    'Russia',
    'Turkey',
    'Japan',
    'Spain',
    'Vietnam',
    'Australia',
    'Argentina',
    'Netherlands',
    'Iran',
    'Colombia',
    'Indonesia',
    'Poland',
    'Portugal',
    'Ukraine',
    'Austria',
    'Taiwan',
    'Malaysia',
    'Thailand',
    'China',
    'Pakistan'
  ];
  String dropdownvalue = 'India';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: CovidData.covidData.fetchWorldData(contry: dropdownvalue),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                Covid data = snapshot.data;
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              child:
                                  Icon(Icons.supervised_user_circle_outlined),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${data.countryText ?? "0 "}",
                              style:
                                  const TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(
                                    3.0,
                                    3.0,
                                  ),
                                  blurRadius: 7.0,
                                  // spreadRadius: 2.0,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Center(child: Text("Select Conty")),
                                const Spacer(),
                                DropdownButton(
                                  value: dropdownvalue,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                      CovidData.covidData.fetchWorldData(
                                          contry: "${dropdownvalue}");
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CarouselSlider(
                          items: [
                            Container(
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/banner-4.png"),
                                    fit: BoxFit.fill),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(
                                      3.0,
                                      3.0,
                                    ),
                                    blurRadius: 7.0,
                                    // spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/banner-small.jpg"),
                                    fit: BoxFit.fill),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(
                                      3.0,
                                      3.0,
                                    ),
                                    blurRadius: 7.0,
                                    // spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/banner-1.png"),
                                    fit: BoxFit.fill),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(
                                      3.0,
                                      3.0,
                                    ),
                                    blurRadius: 7.0,
                                    // spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                            height: 160,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            onPageChanged: (int, CarouselPageChangedReason) {
                              setState(() {
                                // isCard = !isCard;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: const [
                            Text(
                              "What Do you need?",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(
                                      3.0,
                                      3.0,
                                    ),
                                    blurRadius: 7.0,
                                    // spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    "Active Cases",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  (data.activeCasesText!.isEmpty)
                                      ? const Text(
                                          "${0}",
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        )
                                      : Text(
                                          "${data.activeCasesText}",
                                          style: const TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(
                                      3.0,
                                      3.0,
                                    ),
                                    blurRadius: 7.0,
                                    // spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    "New Cases",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  (data.newCasesText!.isEmpty)
                                      ? const Text(
                                          "0",
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        )
                                      : Text(
                                          "${data.newCasesText}",
                                          style: const TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 23,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(
                                      3.0,
                                      3.0,
                                    ),
                                    blurRadius: 7.0,
                                    // spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    "New Deaths",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  (data.newDeathsText!.isEmpty)
                                      ? const Text(
                                          "0",
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        )
                                      : Text(
                                          "${data.newDeathsText}",
                                          style: const TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(
                                      3.0,
                                      3.0,
                                    ),
                                    blurRadius: 7.0,
                                    // spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    "Total Cases",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  (data.totalCasesText!.isEmpty)
                                      ? const Text(
                                          "0",
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        )
                                      : Text(
                                          "${data.totalCasesText}",
                                          style: const TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 23,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(
                                      3.0,
                                      3.0,
                                    ),
                                    blurRadius: 7.0,
                                    // spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    "Total Deaths",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "${data?.totalDeathsText}",
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(
                                      3.0,
                                      3.0,
                                    ),
                                    blurRadius: 7.0,
                                    // spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    "Total Recovered",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "${data?.totalRecoveredText}",
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
