# Plymouth-Creator-Nixos
## Instructions 

1. clone this repo where you want the nix module to be:

```git clone https://github.com/thecosmicode/Plymouth-Creator-Nixos```

2. cd into the folder:

```cd Plymouth-Creator-Nixos```

3. make the installer script executable:

``` chmod +x installer.sh```

4. run the script:

```./installer.sh```

the script will ask for a path to a video file the theme will be made from; provide the path to continue.

5. add the following lines to your configuration.nix file:
```
boot.plymouth = {
  enable = true;
  theme = "custom-plymouth-theme";
  themePackages = [
      (pkgs.callPackage ./relative/path/to/custom-plymouth-theme {})
  ];
};
```
and replace ./relative/path/to/custom-plymouth-theme with the path to the repo folder.
