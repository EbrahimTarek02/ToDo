import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Spacer(flex: 15,),
          Expanded(
            flex: 85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Language',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                DropdownButton(
                  isExpanded: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  borderRadius: BorderRadius.circular(20),
                  value: 'en',
                  onChanged: (newValue) {

                  },
                  items: [
                    DropdownMenuItem(
                      child: Text('العربية'),
                      value: 'ar',
                    ),
                    DropdownMenuItem(
                      child: Text('English'),
                      value: 'en',
                    ),
                  ],
                ),
                SizedBox(height: 40.0,),
                Text(
                  'Mode',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                DropdownButton(
                  isExpanded: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  borderRadius: BorderRadius.circular(20),
                  value: false,
                  onChanged: (newValue) {

                  },
                  items: [
                    DropdownMenuItem(
                      child: Text('Light'),
                      value: false,
                    ),
                    DropdownMenuItem(
                      child: Text('Dark'),
                      value: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
