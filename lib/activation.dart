import 'package:flutter/material.dart';

class ActivationPage extends StatefulWidget {
  const ActivationPage({Key? key}) : super(key: key);

  @override
  _ActivationPageState createState() => _ActivationPageState();
}

class _ActivationPageState extends State<ActivationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = '';
  String _gender = '';
  String _address = '';
  String _placeOfBirth = '';
  String _birthdate = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Process the form data
      print('Nama Lengkap: $_name');
      print('Jenis Kelamin: $_gender');
      print('Alamat: $_address');
      print('Tempat Lahir: $_placeOfBirth');
      print('Tanggal Lahir: $_birthdate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/media/logo.png',
            height: 50,
            width: 50,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Lengkapi Data Anda',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukan Nama Lengkap Anda';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value ?? '';
                  },
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
                  items: [
                    DropdownMenuItem(
                      value: 'Laki - laki',
                      child: const Text('Laki - laki'),
                    ),
                    DropdownMenuItem(
                      value: 'Perempuan',
                      child: const Text('Perempuan'),
                    ),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap Pilih Salah Satu';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _gender = value.toString();
                    });
                  },
                  value: _gender.isNotEmpty ? _gender : null,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Alamat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukan Alamat Anda';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _address = value ?? '';
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Tempat Lahir'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukan Tempat Lahir Anda';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _placeOfBirth = value ?? '';
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Tanggal Lahir'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukan Tanggal Lahir Anda';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _birthdate = value ?? '';
                  },
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
