import 'package:flutter/material.dart';

class PricingScreen extends StatelessWidget {
  const PricingScreen({super.key});

  Widget _buildPriceCard({
    required BuildContext context,
    required String title,
    required String price,
    required List<String> features,
    required Color cardColor,
    required Color buttonColor,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            Text(
              price,
              style: textTheme.titleLarge?.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 16.0),
            const Divider(color: Colors.white30),
            const SizedBox(height: 16.0),
            ...features.map((feature) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.check_circle_outline, color: Colors.greenAccent[400], size: 20),
                      const SizedBox(width: 8.0),
                      Expanded(child: Text(feature, style: textTheme.bodyMedium?.copyWith(color: Colors.white))),
                    ],
                  ),
                )),
            const SizedBox(height: 24.0),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  textStyle: textTheme.labelLarge,
                ),
                onPressed: () {
                  // Handle plan selection
                },
                child: const Text('Choose Plan', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pricing Plans'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade400, Colors.purple.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          children: <Widget>[
            _buildPriceCard(
              context: context,
              title: 'Apprentice Diviner',
              price: 'Free',
              features: [
                'Basic Tarot Readings',
                'Daily Horoscope Snippets',
                'Limited Crystal Ball Gazing',
                'Access to Community Forum',
              ],
              cardColor: Colors.deepPurple.shade700,
              buttonColor: Colors.amber.shade700,
            ),
            _buildPriceCard(
              context: context,
              title: 'Seasoned Sorceress',
              price: '\$9.99/moon',
              features: [
                'All Apprentice Features',
                'Unlimited Tarot Spreads',
                'Personalized Potion Recipes',
                'Weekly Group Seance Circles',
                'Moon Phase Ritual Guides',
              ],
              cardColor: Colors.purple.shade700,
              buttonColor: Colors.orange.shade600,
            ),
            _buildPriceCard(
              context: context,
              title: 'Arch-Mage Mystic',
              price: '\$29.99/moon',
              features: [
                'All Sorceress Features',
                'Direct Spirit Channeling',
                'Custom Spell Crafting',
                'Monthly One-on-One Oracle Session',
                'Priority Access to New Rituals',
                'Exclusive Astral Projection Workshops',
              ],
              cardColor: Colors.indigo.shade800,
              buttonColor: Colors.redAccent.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
