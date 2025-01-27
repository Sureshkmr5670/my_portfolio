import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/device/responsive.dart';

// void main(){
//   runApp(GetMaterialApp(home: Scaffold(body: ContactScreen())));
// }
class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _messageController = TextEditingController();
  final String _emailAddress = 'sureshkmr5670@gmail.com';
  final String _portfolioUrl = 'https://surekmr007.github.io/food-order/';
  final String _phoneNumber = '+918870026247';

  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: _emailAddress,
      query: 'body=${Uri.encodeComponent(_messageController.text)}',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not launch email client'),
        ),
      );
    }
  }

  Future<void> _launchPortfolio() async {
    final Uri url = Uri.parse(_portfolioUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode
            .externalApplication, // This will open in a new tab/window
      );
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not launch portfolio website'),
        ),
      );
    }
  }

  Future<void> _makePhoneCall() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: _phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch phone dialer')),
      );
    }
  }

  Future<void> _openEmailClient() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: _emailAddress,
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobileDevice =
        Responsive.isMobile(context) || Responsive.isMobileLarge(context);
    bool isTabletDevice =
        Responsive.isTablet(context) || Responsive.isTabletLarge(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Contact Me',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Feel free to reach out via the options below:',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Send me a message',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _messageController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'Type your message here...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _sendEmail,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        child: Text(
                          'Send Email',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  onPressed: _sendEmail,
                  tooltip: 'Email',
                ),
                IconButton(
                  icon: const Icon(Icons.phone, color: Colors.white),
                  onPressed: _makePhoneCall,
                  tooltip: 'Phone',
                ),
                IconButton(
                  icon: const Icon(Icons.link, color: Colors.white),
                  onPressed: _launchPortfolio,
                  tooltip: 'Portfolio',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
