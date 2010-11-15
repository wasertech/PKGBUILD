/* See LICENSE file for copyright and license details. */

#include "push.c"

/* appearance */
static const char font[]            = "-*-dina-medium-r-*-*-15-*-*-*-*-*-*-*";
static const char normbordercolor[] = "#2e3435";
static const char normbgcolor[]     = "#000000";
static const char normfgcolor[]     = "#babdb6";
static const char selbordercolor[]  = "#eeeeec";
static const char selbgcolor[]      = "#babdb6";
static const char selfgcolor[]      = "#000000";
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */
static const Bool autofocus         = False;    /* Focus follows mouse */
static const unsigned int topgap    = 19;

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* class       instance    title       tags mask     isfloating   monitor */
	{ "MPlayer",   NULL,       NULL,       0,            True,        -1 },
	{ "Gimp",      NULL,       NULL,       0,            True,        -1 },
	{ "qemu",      NULL,       NULL,       0,            True,        -1 },
	{ "fontforge", NULL,       NULL,       0,            True,        -1 },
	{ "Vncviewer", NULL,       NULL,       0,            True,        -1 },
};

/* layout(s) */
static const float mfact      = 0.5;   /* factor of master area size [0.05..0.95] */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "bash", "-c", "exe=\"`dmenu_path | dmenu`\" && eval \"$exe\"", NULL };
static const char *rootcmd[]  = { "sh", "-c", "exe=\"`dmenu_path | rdmenu`\" && exec sudo -A bash -c \"$exe\"", NULL };
static const char *termcmd[]  = { "/usr/bin/env", "SHLVL=0", "st", NULL };
static const char *lockcmd[]  = { "i3lock", "-c", "3465a4", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_r,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_r,      spawn,          {.v = rootcmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_space,  spawn,          {.v = lockcmd } },
	{ MODKEY,                       XK_t,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Tab,    focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_n,      focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_t,      pushdown,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_n,      pushup,         {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_s,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Escape, killclient,     {0} },
	{ MODKEY,                       XK_l,      setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_l,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_apostrophe,  focusmon,  {.ui = 0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.ui = 1 } },
	{ MODKEY|ShiftMask,             XK_apostrophe,  tagmon,    {.ui = 0 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.ui = 1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY,                       XK_q,      state,          {.ui = StRestart} },
	{ MODKEY|ShiftMask,             XK_q,      state,          {.ui = StShutdown} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
};

