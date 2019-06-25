 {config, pkgs, ...}:
 {
   imports = [ <personal-channel> ];
   # You need to configure a root filesytem
   fileSystems."/".label = "vmdisk";
 
   # The test vm name is based on the hostname, so it's nice to set one
   networking.hostName = "vmhost"; 
 
   # Add a test user who can sudo to the root account for debugging
   users.extraUsers.vm = {
     password = "vm";
     shell = "${pkgs.bash}/bin/bash";
     group = "wheel";
   };
   security.sudo = {
     enable = true;
     wheelNeedsPassword = false;
   };
 
   # Enable your new service!
   personal.mono.enable = true;
 }
