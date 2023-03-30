import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/state/base_state.dart';
import 'package:picker/core/init/network/login/api_urls.dart';
import 'package:picker/view/auth/model/companies.dart';

class EntryCompanyView extends StatefulWidget {
  const EntryCompanyView({super.key});

  @override
  State<EntryCompanyView> createState() => _EntryCompanyViewState();
}

class _EntryCompanyViewState extends BaseState<EntryCompanyView> {
  List? companies;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dioGet();
    });
  }

  dioGet() async {
    final response = await networkManager.dioGet<CompanyModel>(
      path: ApiUrls.veriTabanlari,
      bodyModel: CompanyModel(),
    );
    final data = response.data;
    log("--------------------------------------------------");
    log(data.toString());
    return data;
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: Colors.white70,
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: false,
              title: const Text('Şirkete Giriş'),
            ),
            body: Padding(
              padding: context.paddingNormal,
              child: Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: formKey,
                onChanged: () {
                  formKey.currentState!.validate();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      readOnly: true,
                      onChanged: (value) {
                        print(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Şirket Adı Boş Olamaz';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Şirket Adı',
                        hintText: 'Şirket Adı',
                        suffixIcon: IconButton(
                            onPressed: () {
                              dialogManager
                                  .showAlertDialog(companies.toString());
                            },
                            icon: const Icon(Icons.more_horiz)),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Şirket Şifresi',
                        hintText: 'Şirket Şifresi',
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                          }
                        },
                        child: const Text("Gönder"))
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
