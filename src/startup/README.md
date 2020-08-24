Startup scripts

* The device is configured by /etc/rc.local to execute startup.sh.
* It checks the input value on the mode pin.
* If the mode pin's value is HIGH, it calls start_ap_mode.sh
* If the mode pin's value is LOW, it calls start_normal_mode.sh