import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker/screen/Expenses/bloc/create_category_bloc/create_category_bloc_bloc.dart';
import 'package:expense_tracker/screen/Expenses/view/conversion/icon_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

getCategoryCreation(BuildContext context) {
  List<IconData> expenseIcon = [
    CupertinoIcons.train_style_one,
    FontAwesomeIcons.burger,
    FontAwesomeIcons.car,
    FontAwesomeIcons.mobile,
    FontAwesomeIcons.wallet,
    FontAwesomeIcons.cat,
    FontAwesomeIcons.personDress,
    FontAwesomeIcons.shirt
  ];
  showDialog(
      context: context,
      builder: (ctx) {
        //initailize here because we do not it ouside we need it inside the dialogbox
        Color categoryColor = Colors.white;
        bool showContainer = false;
        IconData? iconChoose;
        TextEditingController nameController = TextEditingController();
        TextEditingController colorController = TextEditingController();
        TextEditingController iconController = TextEditingController();
        bool isLoading = false;
        return BlocProvider.value(
          value: context.read<CreateCategoryBloc>(),
          child: StatefulBuilder(builder: (context, setState) {
            return BlocListener<CreateCategoryBloc, CreateCategoryBlocState>(
              listener: (context, state) {
                if (state is CreateCategoryBlocLoading) {
                  setState(() {
                    isLoading = true;
                  });
                } else if (state is CreateCategoryBlocSuccess) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Category sucessfully created'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cant Created'),
                    ),
                  );
                }
              },
              child: AlertDialog(
                content: SingleChildScrollView(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: nameController,
                          cursorWidth: 2,
                          onTap: () {},
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Name",
                            hintStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
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
                          controller: iconController,
                          cursorWidth: 10,
                          readOnly: true,
                          showCursor: false,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Icon",
                            hintStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                            hoverColor: Colors.blue,
                            prefixIcon: Icon(
                              FontAwesomeIcons.icons,
                              color: Colors.grey.shade700,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showContainer = !showContainer;
                                  FocusScope.of(context).unfocus();
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
                                height: 100,
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
                                    crossAxisCount: 3,
                                  ),
                                  itemCount: expenseIcon.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              iconChoose = expenseIcon[index];
                                            },
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: iconChoose ==
                                                        expenseIcon[index]
                                                    ? Colors.green
                                                    : Colors.black,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Icon(
                                            expenseIcon[index],
                                            size: 40,
                                          ),
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
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (ctx2) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ColorPicker(
                                            pickerColor: categoryColor,
                                            onColorChanged: (value) {
                                              setState(() {
                                                categoryColor = value;
                                              });
                                            }),
                                        SizedBox(
                                          height: kToolbarHeight,
                                          width: double.infinity,
                                          child: TextButton(
                                            onPressed: () {
                                              print(categoryColor);
                                              Navigator.pop(ctx2);
                                            },
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
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
                                  );
                                });
                          },
                          cursorWidth: 5,
                          showCursor: false,
                          readOnly: true,
                          controller: colorController,
                          decoration: InputDecoration(
                            fillColor: categoryColor,
                            filled: true,
                            hintText: "Color",
                            hintStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                            hoverColor: Colors.blue,
                            prefixIcon: Icon(
                              FontAwesomeIcons.magnifyingGlassArrowRight,
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
                          height: 10,
                        ),
                        SizedBox(
                          height: kToolbarHeight,
                          width: double.infinity,
                          child: isLoading == true
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : TextButton(
                                  onPressed: () {
                                    Category category = Category.empty;
                                    category.categoryId = const Uuid().v1();
                                    category.name = nameController.text;
                                    category.icon =iconDataToString(iconChoose!);
                                    category.color = categoryColor.value;
                                    context
                                        .read<CreateCategoryBloc>()
                                        .add(CreateCategory(category));
                                  },
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
              ),
            );
          }),
        );
      });
}
