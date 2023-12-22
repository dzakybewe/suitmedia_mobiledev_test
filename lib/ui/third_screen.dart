import 'package:flutter/material.dart';
import 'package:suitmedia_mobiledev_test/data/api/api_service.dart';
import 'package:suitmedia_mobiledev_test/data/model/user.dart';


class ThirdScreen extends StatefulWidget {
  static const routeName = 'third_screen';
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;
  int page = 1;
  User? userData;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    ApiService().fetchUserList(page: page).then((user) {
      setState(() {
        userData = user;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollListener() async {
    if (isLoadingMore) return;
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      setState(() {
        isLoadingMore = true;
      });
      page++;
      final moreUserData = await ApiService().fetchUserList(page: page);
      if (moreUserData.data.isEmpty) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No more data available'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      } else {
        setState(() {
          userData!.data.addAll(moreUserData.data);
          isLoadingMore = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
          ),
        ),
        title: const Text('Third Screen'),
      ),
      body: userData == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: isLoadingMore ? userData!.data.length + 1 : userData!.data.length,
              itemBuilder: (context, index) {
                if (index < userData!.data.length) {
                  final user = userData!.data[index];
                  return _buildListTile(user, context);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
    );
  }


  Widget _buildListTile(Datum user, BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: (){
            Navigator.pop(context, '${user.firstName} ${user.lastName}');
          },
          contentPadding: EdgeInsets.zero,
          visualDensity: const VisualDensity(vertical: 2),
          title: Text(
            '${user.firstName} ${user.lastName}',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),
          ),
          leading: ClipOval(
            child: Image.network(
              user.avatar,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          subtitle: Text(
            user.email,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF686777),
            ),
          ),
        ),
        const Divider(
          thickness: 0.5,
        )
      ],
    );
  }
}
