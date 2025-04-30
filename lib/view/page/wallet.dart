import 'package:Food_Khan/widget/page/wallet/custom_list_tile.dart';
import 'package:Food_Khan/widget/page/wallet/wallet_card.dart';
import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36), 
                bottomRight: Radius.circular(36),
              ),
              child: Container(
                color: Colors.teal.shade700,
                height: 450,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 70),
                      Center(
                        child: Text(
                          "Your Cadit Card",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      ListTile(
                        //leading: Icon(Icons.arrow_back),
                        title: Text(
                          "Click to add more Cradit Card\nCard to Wallet",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        trailing: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.yellow.shade700,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 10),
                      CardWallet(),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 12),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '    Featured',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,letterSpacing: 1.4),
            ),
          ),
          SizedBox(height: 28),
          CustomListTile(Icons.bar_chart, "View analytics"),
          SizedBox(height: 12),
          CustomListTile(Icons.account_balance_wallet, "Pass Book"),
          SizedBox(height: 12),
          CustomListTile(Icons.account_balance, "Bank Account"),
          SizedBox(height: 40),
          
          InkWell(
            onTap: () {
              
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal.shade700,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            child: Center(
              child: Text(
                "Add Money",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
