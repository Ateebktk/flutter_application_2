import 'package:flutter/material.dart';
import 'package:flutter_application_2/bankofamerica.dart';
import 'package:flutter_application_2/transaction.dart';

// Main Function
void main() {
  runApp(const MyApp());
}

// Main Application Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavScreen(),
    );
  }
}

// Transaction Model
class Transaction {
  final String title;
  final double amount;
  final DateTime date;
  final IconData icon;
  final Color iconColor;

  Transaction({
    required this.title,
    required this.amount,
    required this.icon,
    required this.date,
    required this.iconColor,
    required Color text,
  });
}

// Main Screen (Custom Button Navigation)
class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  // List of screens
  final List<Widget> _screens = [
    const CreditCardScreen(),
    const CreditCardScreen1(),
    const MessageScreen(),
  ];

  // Handle button click to change screen
  void _onButtonTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Example'),
      ),
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Main button
            ElevatedButton(
              onPressed: () => _onButtonTapped(0),
              child: const Text('Main'),
            ),
            // Transactions button
            ElevatedButton(
              onPressed: () => _onButtonTapped(1),
              child: const Text('Transactions'),
            ),
            // Bank of America button
            ElevatedButton(
              onPressed: () => _onButtonTapped(2),
              child: const Text('Bank of America'),
            ),
          ],
        ),
      ),
    );
  }
}

// Credit Card Screen Widget
class CreditCardScreen extends StatelessWidget {
  const CreditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = [
      Transaction(
        title: 'Buy Camera',
        text: const Color.fromARGB(255, 231, 230, 229),
        date: DateTime(2023, 11, 2),
        amount: 1200,
        icon: Icons.camera_alt,
        iconColor: Colors.lightBlue,
      ),
      Transaction(
        title: 'Buy Television',
        text: const Color.fromARGB(255, 231, 230, 229),
        date: DateTime(2023, 11, 2),
        amount: 1200,
        icon: Icons.tv,
        iconColor: Colors.green,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            146, 34, 126, 18), // Updated background color for AppBar
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          }, // Go back to the previous screen
        ),
        title: const Text(
          'Credit Card',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const CreditCard(),
          Expanded(
            child: TransactionList(transactions: transactions),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'Pay',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Transaction List Widget
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    double total = transactions.fold(
      0,
      (sum, transaction) => sum + transaction.amount,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    transactions[index].icon,
                    color: transactions[index].iconColor,
                  ),
                  title: Text(
                    transactions[index].title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '\$${transactions[index].amount.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.green),
                  ),
                  trailing: Text(
                    '${transactions[index].date.month}/${transactions[index].date.year}',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'TOTAL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '-\$${total.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Credit Card Widget
class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green, // Card background color
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icon container
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.amber, // Background for the card icon
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.credit_card,
                  color: Colors.black, // Icon color
                ),
              ),
              const Spacer(),
              // Visa logo image
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/2560px-Visa_Inc._logo.svg.png',
                height: 20,
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Displaying card number
          const Text(
            '1237 6890 7654 5678',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Card holder details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CARD HOLDER',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'Muhammad Ateeb',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              // Expiry date details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EXPIRES',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '10/24',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Placeholder Settings Screen Widget
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Settings Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Placeholder Transaction Screen Widget
class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Transactions Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
