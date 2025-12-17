{ lib, ... }:
{
  imports = [
    ../../../../../common/gpu/nvidia/prime.nix
    ../../../../../common/gpu/nvidia/pascal
    ../../../../../common/cpu/intel/comet-lake
    ../.
  ];

  hardware = {
    graphics = {
      enable = lib.mkDefault true;
      enable32Bit = lib.mkDefault true;
    };

    nvidia = {
      prime = {
        # 00:02.0 VGA compatible controller: Intel Corporation CometLake-H GT2 [UHD Graphics] (rev 05)
        intelBusId = lib.mkDefault "PCI:0:2:0";
        # 01:00.0 3D controller: NVIDIA Corporation GP107GLM [Quadro P620] (rev a1)
        nvidiaBusId = lib.mkDefault "PCI:1:0:0";
      };
    };
  };

  services.thermald.enable = lib.mkDefault true;
}
