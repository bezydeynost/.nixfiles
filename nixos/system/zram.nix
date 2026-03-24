{...}: {
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 20;
    priority = 100;
  };
}
