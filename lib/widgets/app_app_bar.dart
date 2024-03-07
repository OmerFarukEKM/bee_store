import 'package:flutter/material.dart';

class AppAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AppAppBar({Key? key}) : super(key: key);

  @override
  _AppAppBarState createState() => _AppAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

/* 


PreferredSizeWidget'ın bir alt sınıfı olarak, AppBar'ın beklentisi, preferredSize adlı bir getter metodunu içermesidir. Bu metod, AppBar'ın boyutunu belirlemek için kullanılır.

Size.fromHeight(kToolbarHeight) ifadesi, bir Size nesnesini kToolbarHeight değeri ile oluşturur. kToolbarHeight, genellikle bir AppBar'ın yüksekliği olarak kullanılan bir sabittir ve Flutter tarafından varsayılan olarak tanımlanır.

Bu getter metodunun kullanım amacı, AppBar'ın yüksekliğini belirtmek ve bu sayede AppBar'ın ekranın üst kısmında ne kadar yer kaplayacağını belirlemektir. Bu değer, PreferredSizeWidget türünden bir widget kullanıldığında AppBar tarafından otomatik olarak alınır.

Özetle, Size.fromHeight(kToolbarHeight) ifadesi, preferredSize getter metodunun bir parçası olarak, AppBar'ın yüksekliğini belirleyen bir değer döndürür. Bu değer, genellikle kullanıcı arayüzü tasarımında standart bir AppBar yüksekliği olan kToolbarHeight'e eşittir.



*/
class _AppAppBarState extends State<AppAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Home"),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_outlined),
          iconSize: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: () {},
            icon: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                "assets/bag-2.png",
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
