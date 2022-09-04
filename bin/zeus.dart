import 'package:zeus/zeus.dart' as zeus;
import 'package:system/system.dart';
import 'dart:io';
void main(){
 choice();
}
var distro;

void choice()
{

 print("Choose what you want to do:");
 print("[1]Add Snap support");
 print("[2]Add Flatpak Support");
 print("[3]Update the System");
 print("[4]Autoremove"); 
 var option = int.parse(stdin.readLineSync()!);

 System.invoke("clear");
 print("What distro are you on?");
 print("List of supported distros:");
 print("[1]Fedora");
 print("[2]Arch");
 print("[3]Linux Mint");
 print("[4]Ubuntu");
 distro = int.parse(stdin.readLineSync()!);
//Wait for 3 sec 
 var duration = const Duration(seconds: 3);
 System.invoke("clear");
 print("Processing Your Data");
 sleep(duration);

 switch (option){
 case 1:
  snap_support();
  break;
 case 2:
  flatpak_support();
  break;
 case 3:
  update_system();
  break;
 case 4:
  autoremove();
  break;
 default:
  print("Wrong Input");
  break;

 }
}

void snap_support(){
 switch (distro)
 {
  case 1:
   System.invoke("sudo dnf install snapd");
   System.invoke("sudo ln -s /var/lib/snapd/snap /snap");
   break;
  case 2:
   System.invoke("git clone https://aur.archlinux.org/snapd.git");
   System.invoke("cd snapd");
   System.invoke("makepkg -si");
   System.invoke("sudo systemctl enable --now snapd.socket");
   System.invoke("do ln -s /var/lib/snapd/snap /snap");
   break;
  case 3:
   System.invoke("sudo mv /etc/apt/preferences.d/nosnap.pref");
   System.invoke("sudo apt update");
   System.invoke("sudo apt install snapd");
   break;
  case 4:
   System.invoke("sudo apt install snapd");
   break;
  default:
  print("WRONG INPUT");
  break;
 }


}
void flatpak_support(){
switch(distro){
 case 1:
  print("Flatpak is installed by default, no documentation on flathub.");
  break;
 case 2:
  System.invoke("sudo pacman -S flatpak");
  print("Restart will be needed");
  break;
 case 3:
  print("Flatpak support is installed but going to proceed anyway:");
  System.invoke("sudo apt install flatpak");
  System.invoke("flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo");
  break;
 case 4:
  System.invoke("sudo apt install flatpak");
  System.invoke("flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo");
  break;

}

}
void update_system(){
 switch(distro){
 case 1:
  System.invoke("sudo dnf update");
  break;
 case 2:
  System.invoke("sudo pacman -Syy");
  break;
 case 3:
  System.invoke("sudo apt update");
  System.invoke("sudo apt upgrade");
  break;
 case 4:
  System.invoke("sudo apt update");
  System.invoke("sudo apt upgrade");
  break;

 }

}
void autoremove()
{
 switch(distro){
  case 1:
   System.invoke("sudo dnf autoremove");
   break;
  case 2:
   print("Not available for Arch(at least yet");
   break;
  case 3:
   System.invoke("sudo apt autoremove");
   break;
  case 4:
   System.invoke("sudo apt autoremove");
   break;

 }

}