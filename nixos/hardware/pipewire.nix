{
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    jack.enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };

    # Ниже настройки имеют формат "число - название"
    # Число определяет приоритет настройки, а название описывает цель конфига
    # extraConfig.pipewire = {
    #   "10-clock-rate" = {
    #     "context.properties" = {
    #       "default.clock.rate" = 48000;
    #       "default.clock.allowed-rates" = [ 44100 48000 88200 96000 176400 192000 352800 384000 705600 768000 ];
    #     };
    #   };
    #   # Ниже настройки для минимальной задержки в играх (например osu!stable через wine)
    #   # quantum — устанавливает размер буфера (чем меньше значение, тем ниже задержка, но выше нагрузка на процессор).
    #   # Можно посчитать теоретическую задержку в секундах, поделив quantum на rate (48/48000 будет 1мс)
    #   # Если со звуком есть проблемы (щелчки, прерывания), попробуйте увеличить значение (64, 128, 256) или просто удалить эту настройку
    #   # По умолчанию я закомментировал настройку, чтоб у людей не было проблем
    #   # "92-low-latency" = { 
    #   #   default.clock.quantum = 32; # default = 1024
    #   #   default.clock.min-quantum = 32; # default = 32
    #   #   default.clock.max-quantum = 32; # default = 2048
    #   # };
    # };
    
    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 512; 
        "default.clock.min-quantum" = 32; 
        "default.clock.max-quantum" = 2048;  
      };
    };


    #wireplumber = {
	#enable = true;
	# Запретить конкретному софту редактировать громкость микрофона
      	# В терминал `wpctl status`, найти нужное приложение в списке клиентов
      	# Потом `wpctl inspect номер-клиента | grep application.process.binary`
      	# `systemctl --user restart wireplumber pipewire pipewire-pulse`
      	# Доп ссылки по теме
      	# https://www.reddit.com/r/archlinux/comments/190dvl8/pipewirewayland_how_to_stop_applications_from/
      	# https://askubuntu.com/questions/749407/is-there-any-way-to-prevent-application-from-changing-volume-level-of-my-microph
      	# https://www.linux.org/threads/prevent-applications-from-changing-microphone-gain.41636/
      	# https://www.reddit.com/r/Ubuntu/comments/pvlm6r/how_to_disable_microphone_autoadjusting/
      	# https://wiki.archlinux.org/title/Firefox/Tweaks#Disable_WebRTC_audio_post_processing
      
     	# Если не помогает и сайты в браузере косячат, то есть такие решения:
      	# 1) Firefox или его форки - в браузерной строке пишешь и открываешь about:config
     	#    Там делаешь media.getusermedia.agc_enabled false. Это Automatic Gain Control
      	# 2) Chromium или его форки - в браузерной строке пишешь и открываешь chrome://flags/
    	  #    Там ставишь Allow WebRTC to adjust the input volume = Disabled
		
     	# Я решил сделать вайтлист. В стоке я запрещаю всем редачить громкость микро в системе
     	# Лишь определённый софт может редачить громкость моего микрофона
	# extraScripts."99-stop-microphone-auto-adjust.lua" = ''
        # table.insert (default_access.rules,{
        #  matches = {
        #    {
        #      { "application.process.binary", "=", "*" }
        #    }
        #  },
        #  default_permissions = "r-x",
        # })
        # table.insert (default_access.rules,{
        #  matches = {
        #    {
        #      { "application.process.binary", "=", ".pavucontrol-wrapped" }
        #    },
        #    {
        #      { "application.process.binary", "=", ".easyeffects-wrapped" }
        #    }
        #  },
        #  default_permissions = "rwx",
        # })
        #'';
    #};
  };
}
