
class DrawerItem {
  final String title;
  final int type;
  final String svgSrc;

  DrawerItem({required this.title, required this.type, required this.svgSrc});
}

List<DrawerItem> listMenuItem = [
  DrawerItem(
      title: 'Dashboard', type: 1, svgSrc: "assets/icons/menu_dashbord.svg"),
  DrawerItem(
      title: 'Table Data', type: 2, svgSrc: "assets/icons/menu_tran.svg"),
  DrawerItem(
      title: 'Excel', type: 3, svgSrc: "assets/icons/menu_task.svg"),
  DrawerItem(
      title: 'Documents', type: 4, svgSrc: "assets/icons/menu_doc.svg"),
  DrawerItem(
      title: 'Store', type: 5, svgSrc: "assets/icons/menu_store.svg"),
  DrawerItem(
      title: 'Notification', type: 6, svgSrc: "assets/icons/menu_notification.svg"),
  DrawerItem(
      title: 'Profile', type: 7, svgSrc: "assets/icons/menu_profile.svg"),
  DrawerItem(
      title: 'Settings', type: 8, svgSrc: "assets/icons/menu_setting.svg"),
];
