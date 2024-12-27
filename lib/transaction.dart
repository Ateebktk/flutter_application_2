import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';

// Transaction Model
class Transaction {
  final String title;
  final double amount;
  final IconData icon;
  final Color iconColor;
  final Color textColor;

  Transaction({
    required this.title,
    required this.amount,
    required this.icon,
    required this.iconColor,
    required this.textColor,
  });
}

// Credit Card Widget
class CreditCard1 extends StatelessWidget {
  const CreditCard1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.credit_card,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/2560px-Visa_Inc._logo.svg.png',
                height: 20,
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            '4802 2215 1183 4289',
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
            ],
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
    return Container(
      padding: const EdgeInsets.all(16),
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
              style: TextStyle(color: transactions[index].textColor),
            ),
            subtitle: Text(
              '\$${transactions[index].amount.toStringAsFixed(2)}',
              style: TextStyle(color: transactions[index].textColor),
            ),
          );
        },
      ),
    );
  }
}

// Credit Card Screen with Transactions
class CreditCardScreen1 extends StatelessWidget {
  const CreditCardScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = [
      Transaction(
        title: 'Water bill',
        amount: 280,
        icon: Icons.water,
        iconColor: Colors.orange,
        textColor: Colors.white,
      ),
      Transaction(
        title: 'Income.salary OCT',
        amount: 1200,
        icon: Icons.money,
        iconColor: Colors.green,
        textColor: Colors.white,
      ),
      Transaction(
        title: 'Electric bill',
        amount: 657,
        icon: Icons.electrical_services,
        iconColor: Colors.blue,
        textColor: Colors.white,
      ),
      Transaction(
        title: 'Internet bill',
        amount: 1000,
        icon: Icons.wifi,
        iconColor: Colors.purple,
        textColor: Colors.white,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            124, 7, 156, 39), // Updated AppBar background color
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreditCardScreen()),
            );
          },
        ),
        title: const Text(
          'Credit Card',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const CreditCard1(),
          Expanded(
            child: TransactionList(transactions: transactions),
          ),
        ],
      ),
    );
  }
}
