import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpenses extends StatefulWidget {
  const AddExpenses({super.key});

  @override
  State<AddExpenses> createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  TextEditingController moneyController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List<IconData> expenseIcon = [
    CupertinoIcons.train_style_one,
    FontAwesomeIcons.burger,
    FontAwesomeIcons.car,
    FontAwesomeIcons.mobile,
    FontAwesomeIcons.wallet
  ];

  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Expenses",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  controller: moneyController,
                  onTap: () {},
                  cursorWidth: 5,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hoverColor: Colors.blue,
                    prefixIcon: Icon(
                      CupertinoIcons.money_dollar,
                      color: Colors.grey.shade700,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: categoryController,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        bool showContainer = false;
                        return StatefulBuilder(builder: (context, setState) {
                          return AlertDialog(
                            content: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    cursorWidth: 2,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "Name",
                                      hintStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                      hoverColor: Colors.blue,
                                      prefixIcon: Icon(
                                        FontAwesomeIcons.magnet,
                                        color: Colors.grey.shade700,
                                      ),
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    cursorWidth: 10,
                                    readOnly: true,
                                    showCursor: false,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "Icon",
                                      hintStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                      hoverColor: Colors.blue,
                                      prefixIcon: Icon(
                                        FontAwesomeIcons.icons,
                                        color: Colors.grey.shade700,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            showContainer = !showContainer;
                                          });
                                        },
                                        icon: const Icon(
                                          CupertinoIcons.chevron_down,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: showContainer
                                            ? const BorderRadius.vertical(
                                                top: Radius.circular(
                                                  12,
                                                ),
                                              )
                                            : const BorderRadius.all(
                                                Radius.circular(12),
                                              ),
                                      ),
                                    ),
                                  ),
                                  showContainer
                                      ? Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 240,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(
                                                12,
                                              ),
                                            ),
                                          ),
                                          child: GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3),
                                            itemCount: expenseIcon.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                    
                                                    ),
                                                    borderRadius: BorderRadius.circular(12)
                                                  ),
                                                  child: Icon(
                                                    expenseIcon[index],
                                                    size:40,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      : Container(),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    cursorWidth: 5,
                                    showCursor: false,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "Color",
                                      hintStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                      hoverColor: Colors.blue,
                                      prefixIcon: Icon(
                                        FontAwesomeIcons
                                            .magnifyingGlassArrowRight,
                                        color: Colors.grey.shade700,
                                      ),
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      });
                },
                cursorWidth: 5,
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "category",
                  hintStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                  hoverColor: Colors.blue,
                  prefixIcon: Icon(
                    FontAwesomeIcons.bars,
                    color: Colors.grey.shade700,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.plus,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: dateController,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(days: 365),
                    ),
                  );
                  if (newDate != null) {
                    dateController.text =
                        DateFormat('dd/MM/yyyy').format(newDate);
                    selectedDate = newDate;
                  }
                },
                readOnly: true,
                cursorWidth: 5,
                showCursor: false,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Date And time",
                  hintStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                  hoverColor: Colors.blue,
                  prefixIcon: Icon(
                    FontAwesomeIcons.calendar,
                    color: Colors.grey.shade700,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: kToolbarHeight,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
