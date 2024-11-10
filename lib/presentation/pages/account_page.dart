import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_list/core/constants/app_strings.dart';
import 'package:sneakers_list/presentation/controllers/account_controller.dart';

class AccountPage extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.account),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.accountInfo,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(
                      leading: Icon(Icons.person),
                      title: Text("John Doe"),
                      subtitle: Text("john.doe@example.com"),
                    ),
                    const Divider(),
                    _buildAccountButton(
                        AppStrings.myOrders, Icons.shopping_bag),
                    _buildAccountButton(AppStrings.wishlist, Icons.favorite),
                    _buildAccountButton(AppStrings.cart, Icons.shopping_cart),
                    _buildAccountButton(AppStrings.logOut, Icons.logout),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              AppStrings.settings,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text(AppStrings.darkTheme),
                      secondary: const Icon(Icons.dark_mode),
                      value: Get.isDarkMode,
                      onChanged: (bool value) {
                        Get.changeThemeMode(
                          value ? ThemeMode.dark : ThemeMode.light,
                        );
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.language),
                      title: const Text(AppStrings.settings),
                      trailing: DropdownButton<String>(
                        value: 'English',
                        items: const [
                          DropdownMenuItem(
                            value: 'English',
                            child: Text('English'),
                          ),
                          DropdownMenuItem(
                            value: 'Arabic',
                            child: Text('العربية'),
                          ),
                          DropdownMenuItem(
                            value: 'Spanish',
                            child: Text('Spanish'),
                          ),
                          DropdownMenuItem(
                            value: 'French',
                            child: Text('French'),
                          ),
                        ],
                        onChanged: (String? newValue) {
                          print("Language selected: $newValue");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountButton(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        print("$title tapped");
      },
    );
  }
}
