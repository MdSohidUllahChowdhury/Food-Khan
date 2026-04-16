import 'package:food_khan/controller/provider/cart_provider.dart';
import 'package:food_khan/widget/screens/cart/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CartController>(context, listen: false).loadCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff191D21),
        toolbarHeight: 100,
        elevation: 0,
        title: const Text(
          "Cart",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Consumer<CartController>(
            builder:
                (context, provider, child) => IconButton(
                  onPressed:
                      provider.isLoading || provider.cart.isEmpty
                          ? null
                          : () async {
                            try {
                              await cart.clearCart();
                              if (!mounted) {
                                return;
                              }

                              Get.snackbar(
                                'Cart cleared',
                                'Your cart is now empty.',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.TOP,
                              );
                            } catch (_) {
                              if (!mounted) {
                                return;
                              }

                              Get.snackbar(
                                'Cart error',
                                provider.errorMessage ??
                                    'Unable to clear cart right now.',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.TOP,
                              );
                            }
                          },
                  icon: Icon(
                    FontAwesomeIcons.solidTrashCan,
                    size: 16,
                    color:
                        provider.cart.isEmpty ? Colors.white54 : Colors.white,
                  ),
                ),
          ),
        ],
      ),

      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
        ),
        child: Consumer<CartController>(
          builder:
              (context, provider, child) => Column(
                children: [
                  const SizedBox(height: 15),
                  Expanded(child: _buildCartBody(provider)),
                ],
              ),
        ),
      ),
    );
  }

  Widget _buildCartBody(CartController provider) {
    if (provider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xff191D21)),
      );
    }

    if (provider.errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud_off_rounded,
                size: 72,
                color: Color(0xff191D21),
              ),
              const SizedBox(height: 16),
              Text(
                provider.errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff191D21),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => provider.loadCart(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff191D21),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (provider.cart.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.shopping_cart_outlined,
                size: 90,
                color: Color(0xff191D21),
              ),
              SizedBox(height: 16),
              Text(
                'Your cart is empty',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff191D21),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Add some food items and they will appear here.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => provider.loadCart(showLoading: false),
      child: ListView.builder(
        itemCount: provider.cart.length,
        itemBuilder: (context, index) {
          return CartCard(item: provider.cart[index]);
        },
      ),
    );
  }
}
