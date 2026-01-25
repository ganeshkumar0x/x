const unsigned int interval = 1000;

static const char unknown_str[] = "n/a";

#define MAXLEN 2048

static const struct arg args[] = {
    { run_command,   " W:%s |", "nmcli -t -f active,ssid dev wifi list | awk -F: '/^yes/ {print $2; exit}'" },
    { run_command,   " %s |",   "amixer get Master | awk -F'[][]' '/%/ { vol=$2; state=$(NF-1) } END { print (state == \"on\" ? \"V+:\" : \"V-:\") vol }'" },
    { battery_state, " B%s:",   "BAT0" },
    { battery_perc,  "%s%% |",  "BAT0" },
    { datetime,      " %s ",    "%b-%d %a | %H:%M" },
};
