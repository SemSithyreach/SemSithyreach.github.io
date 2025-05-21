import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      'title': 'Restaurant',
      'subtitle': 'The Curtain, London',
      'amount': '-\$35.00',
      'icon': Icons.restaurant,
      'color': Colors.red,
    },
    {
      'title': 'Grocery Store',
      'subtitle': 'GIANT Food, USA',
      'amount': '-\$230.00',
      'icon': Icons.local_grocery_store,
      'color': Colors.red,
    },
    {
      'title': 'Payment Receive',
      'subtitle': 'Digital Wallet',
      'amount': '+\$50.00',
      'icon': Icons.account_balance_wallet,
      'color': Colors.green,
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Dashboard")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Available Balance in", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 4),
              Text(
                "\$22,1340",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ActionCard(
                      icon: Icons.insert_drive_file,
                      title: "Account Statement",
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ActionCard(
                      icon: Icons.swap_horiz,
                      title: "Fund Transfer",
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text("Transactions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final tx = transactions[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: tx['color'].withOpacity(0.1),
                        child: Icon(tx['icon'], color: tx['color']),
                      ),
                      title: Text(tx['title']),
                      subtitle: Text(tx['subtitle']),
                      trailing: Text(
                        tx['amount'],
                        style: TextStyle(
                          color: tx['color'],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const ActionCard({super.key, required this.icon, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
