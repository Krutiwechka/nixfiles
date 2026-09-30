{
  services.tlp = {
    enable = true;
    settings = {
      TLP_PROFILE_AC = "PRF";
      TLP_PROFILE_BAT = "SAV";
      TLP_AUTO_SWITCH = 2;

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      # ВАЖНО именно сейчас: буст CPU — это и есть те самые резкие скачки
      # потребления, которые проваливают напряжение на ослабленной батарее.
      # Отключаем полностью на батарее, пока не заменишь её.
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      # Дополнительно ограничиваем максимальную частоту на батарее —
      # снижает пиковое энергопотребление сильнее, чем просто отключение boost
      CPU_MAX_PERF_ON_BAT = 60;

      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "auto";

      RADEON_DPM_STATE_ON_AC = "performance";
      RADEON_DPM_STATE_ON_BAT = "battery";
      RADEON_DPM_PERF_LEVEL_ON_AC = "auto";


      # iGPU тоже даёт всплески потребления под нагрузкой (рендер/видео) —
      # ограничиваем её максимальный perf level на батарее
      RADEON_DPM_PERF_LEVEL_ON_BAT = "low";

      # Понижаем яркость подсветки клавиатуры и экрана на батарее —
      # мелочь, но каждый ватт сейчас на счету
      START_CHARGE_THRESH_BAT0 = 40;  # оставляю, даже если EC игнорирует —
      STOP_CHARGE_THRESH_BAT0 = 80;   # вреда нет, на случай если для какой-то прошивки заработает

      # Отключаем Wi-Fi power save на батарее ВРЕМЕННО специально наоборот —
      # чтобы не было дополнительных скачков при пробуждении радио.
      # (обычно советуют "on" на батарее для экономии, но нам сейчас
      # важнее стабильность, а не экономия)
      WIFI_PWR_ON_BAT = "off";
    };
  };
}
