static int topbar = 1;

static const char *fonts[] = {
    "Hack:size=12"
};

static const char *prompt = NULL;

static const char *colors[SchemeLast][2] = {
    [SchemeNorm] = { "gray90", "black" },
    [SchemeSel]  = { "black", "gray90" },
    [SchemeOut]  = { "gray90", "black" },
};

static unsigned int lines = 0;

static const char worddelimiters[] = " ";
