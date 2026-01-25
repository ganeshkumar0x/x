static const unsigned int borderpx       = 0;
static const unsigned int snap           = 32;
static const int swallowfloating         = 0;
static const int showbar                 = 1;
static const int topbar                  = 1;
static const char *fonts[]               = { "Hack:size=12" };
static const char dmenufont[]            = "Hack:size=12";

static const char *colors[][3] = {
	[SchemeNorm] = { "gray90", "black", "black" },
	[SchemeSel]  = { "gray90", "black", "black" },
};

static const char *tags[] = { "TERM", "WEB", "MEDIA", "MISC" };

static const Rule rules[] = {
	{ "Gimp",    NULL,     NULL,           0,         1,          0,           0,        -1 },
	{ "Firefox", NULL,     NULL,           1 << 8,    0,          0,          -1,        -1 },
	{ "st",      NULL,     NULL,           0,         0,          1,           0,        -1 },
	{ NULL,      NULL,     "Event Tester", 0,         0,          0,           1,        -1 },
};

static const float mfact            = 0.55;
static const int nmaster            = 1;
static const int resizehints        = 1;
static const int lockfullscreen     = 1;
static const int refreshrate        = 120;

static const Layout layouts[] = {
	{ "[]=", tile },
	{ "><>", NULL },
	{ "[M]", monocle },
};

#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

static char dmenumon[2]                 = "0";
static const char *dmenucmd[]           = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, NULL };
static const char *termcmd[]            = { "st", NULL };
static const char *browsercmd[]         = { "firefox", NULL };
static const char *slockcmd[]           = { "slock", NULL };
static const char *prtscrcmd[]          = { "/bin/sh", "-c", "mkdir -p /home/rookie/Downloads/screenshots && scrot -s /home/rookie/Downloads/screenshots/%d-%m-%Y_%H-%M-%S.png", NULL };
static const char *volup[]              = { "amixer", "set", "Master", "5%+", NULL };
static const char *voldown[]            = { "amixer", "set", "Master", "5%-", NULL };
static const char *volmute[]            = { "amixer", "set", "Master", "toggle", NULL };
static const char *brightup[]           = { "brightnessctl", "set", "+5%", NULL };
static const char *brightdown[]         = { "brightnessctl", "set", "5%-", NULL };

#include <X11/XF86keysym.h>
static const Key keys[] = {
	{ MODKEY,                       XK_e,             spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_s,             spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,             spawn,          {.v = browsercmd } },
	{ MODKEY|ShiftMask,             XK_l,             spawn,          {.v = slockcmd } },
	{ 0,                            XK_Print,         spawn,          {.v = prtscrcmd } },
	{ 0,                            XF86XK_AudioRaiseVolume, spawn,   {.v = volup } },
	{ 0,                            XF86XK_AudioLowerVolume, spawn,   {.v = voldown } },
	{ 0,                            XF86XK_AudioMute, spawn,          {.v = volmute } },
	{ 0,                            XF86XK_MonBrightnessUp,   spawn,  {.v = brightup } },
	{ 0,                            XF86XK_MonBrightnessDown, spawn,  {.v = brightdown } },
	{ MODKEY,                       XK_g,             togglebar,      {0} },
	{ MODKEY,                       XK_j,             focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,             focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,             incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,             incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,             setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,             setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return,        zoom,           {0} },
	{ MODKEY,                       XK_Tab,           view,           {0} },
	{ MODKEY,                       XK_c,             killclient,     {0} },
	{ MODKEY,                       XK_t,             setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,             setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,             setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,         setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,         togglefloating, {0} },
	{ MODKEY,                       XK_0,             view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,             tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,         focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,        focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,         tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,        tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                             0)
	TAGKEYS(                        XK_2,                             1)
	TAGKEYS(                        XK_3,                             2)
	TAGKEYS(                        XK_4,                             3)
	{ MODKEY|ShiftMask,             XK_q,             quit,           {0} },
};

static const Button buttons[] = {
	{ ClkLtSymbol,   0,       Button1, setlayout,      {0} },
	{ ClkLtSymbol,   0,       Button3, setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,   0,       Button2, zoom,           {0} },
	{ ClkStatusText, 0,       Button2, spawn,          {.v = termcmd } },
	{ ClkClientWin,  MODKEY,  Button1, movemouse,      {0} },
	{ ClkClientWin,  MODKEY,  Button2, togglefloating, {0} },
	{ ClkClientWin,  MODKEY,  Button3, resizemouse,    {0} },
	{ ClkTagBar,     0,       Button1, view,           {0} },
	{ ClkTagBar,     0,       Button3, toggleview,     {0} },
	{ ClkTagBar,     MODKEY,  Button1, tag,            {0} },
	{ ClkTagBar,     MODKEY,  Button3, toggletag,      {0} },
};
