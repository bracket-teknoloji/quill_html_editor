

import 'package:flutter/material.dart';
import 'package:picker/core/base/state/base_state.dart';

class AddCompanyView extends StatefulWidget {
  const AddCompanyView({super.key});

  @override
  State<AddCompanyView> createState() => _AddCompanyViewState();
}

class _AddCompanyViewState extends BaseState<AddCompanyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Company"),
      ),
      body: const Center(
        child: Text("Add Company"),
      ),
    );
  }
}