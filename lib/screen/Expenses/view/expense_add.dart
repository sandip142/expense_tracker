import 'package:expense_tracker/screen/Expenses/bloc/get_category_bloc/get_category_bloc_bloc.dart';
import 'package:expense_tracker/screen/Expenses/view/category_creation.dart';
import 'package:expense_tracker/screen/Expenses/view/conversion/icon_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(
      DateTime.now(),
    );
    super.initState();
  }

  bool ShowListTille = false;

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
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                  getCategoryCreation(context);
                },
                cursorWidth: 5,
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "category",
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
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
                      onPressed: () {
                        setState(() {
                          ShowListTille = !ShowListTille;
                        });
                      },
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: ShowListTille
                        ? const BorderRadius.vertical(
                            top: Radius.circular(
                              20,
                            ),
                          )
                        : const BorderRadius.all(
                            Radius.circular(20),
                          ),
                  ),
                ),
              ),
              ShowListTille
                  ? Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocBuilder<GetCategoryBlocBloc,
                            GetCategoryBlocState>(
                          builder: (context, state) {
                            if (state is GetCategoryBlocSuccess) {
                              print(state.getCategories.length);
                              return ListView.builder(
                                  itemCount: state.getCategories.length,
                              
                                  itemBuilder: (context, index) {
                                    IconData iconFire =stringToIconData(state.getCategories[index].icon);
                                    return Card(
                                      child: ListTile(
                                        leading:
                                             Icon(iconFire),
                                        title:  Text(state.getCategories[index].name),
                                        tileColor:Color(state.getCategories[index].color),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),),
                                      ),
                                    );
                                  });
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    )
                  : Container(),
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
