# -*- coding: utf-8 -*-
import realityconstants as c
# coding=UTF-8
# ==============================================================================
#
# PROJECT REALITY ADMIN SETTINGS (formerly AD Framework)
#
# WARNING: If logging is enabled, a folder must be created under /admin/logs/, or they will not be recorded
#
# $Id: realityconfig_admin.py 20838 2013-06-24 02:41:19Z bloodydeed $
#
#
# ==============================================================================
# dont touch this import
# GLOBAL SETTINGS
#
# If false, the entire RealityAdmin is disabled.
# Default is True
RAEnabled = True
#
# Display a sponsor message.
# Default is False
sponsorMessageEnabled = {{ pyBool .Values.sponsorMessage.enabled }}
#
# The "sponsormessage" will be displayed every [interval] seconds.
# Default is 600 seconds
sponsorMessage = {{ .Values.sponsorMessage.message | quote }}
sponsorMessageInterval = {{ .Values.sponsorMessage.interval }}
#
# Are admins alerted about game notifications? (E.g. FOB Destruction via radio).
# Default is True
gameNotificationsEnabled = True
#
#
# ==============================================================================
# Squads SETTINGS
#
# Seconds after round start until allowed to create squads.
# sqd_noSquadsBefore is subtracted from the number of seconds set in 'PRROUNDSTARTDELAY' var via realityconfig_common.py in order to get the SquadCreationTime.
# Default is 90

{{- with .Values.squads }}
sqd_noSquadsBefore = {{ .noSquadsBefore }}
#
# Resign early
# Default is False
sqd_resignEarly = {{ pyBool .resignEarly }}
#
# Amount of failed attempts before kick
# Default is 0 (disabled)
sqd_kickLimit = {{ .resignEarlyAttempts }}
#
# Kick squadless
# Default is False (disabled)
sqd_kickSquadLess = {{ pyBool .kickSquadLess }}
#
# Time until squadless players are kicked
# Default is 30 seconds
sqd_kickSquadLessTime = {{ .kickSquadLessTime }}
#
#
# Kick unassigned AFK players
# Default is True (enabled)
sqd_kickSquadLessAFK = {{ pyBool .kickSquadLessAFK }}
#
#
# Kick unassigned afk players after the specified number of seconds.
# 1200 seconds (20 mins) default
sqd_kickSquadLessAFKTime = {{ .kickSquadLessAFKTime }}
#
#
# Only kick players once the server reaches this full 0.9 (90%) default
sqd_kickAFKPercent = {{ .kickAFKPercent }}
#
# Kick AFK players *in a squad*
# Default is False (disabled)
sqd_kickSquadedAFK = {{ pyBool .kickSquadedAFK }}
#
# Kick AFK players that are in a squad after the specified number of seconds.
# 1500 seconds (25 mins) default - give at least 15 mins (900 sec) for players in a squad to allow for timers
sqd_kickSquadedAFKTime = {{ .kickSquadedAFKTime }}
{{- end }}
#
#
#
# ==============================================================================
# SMARTBALANCE SETTINGS
{{- with .Values.smartBalance }}
#
# Enable/disable smartbalancing.
# Default is True
smb_enabled = {{ pyBool .enabled }}
#
# Perform smart balance when the difference of the teams is x or more.
# Default is 2
smb_difference = {{ .difference }}
#
# A list of (partial) playernames and/or (clan)tags that get excluded from smart balancing.
# If tag is part of name, you need to define position (front/back) by using * as wild card.
# E.g. to add [R-DEV]PRBot you need to add "[R-DEV]*"
smb_excludeList = [
    "[R-DEV]*", "[R-CON]*", "[R-MOD]*",
]
# If set to True, it will teamswap everyone on round startup.
# Some people don't (or can't) have modmanager to do this for them.
# Default is True
smb_swapTeamsOnStart = {{ pyBool .swapTeamsOnStart}}
#
#
# If set to true, teams will be scrambled at the start of each round
smb_scrambleTeamsOnStart = {{ pyBool .scrambleTeamsOnStart}}
# If set to true, when a player joins the server they will join onto a random team.
# Joining players will still be subject to any smartbalancing.
# By default players always load in on blufor. Default is False.
smb_randomiseJoinTeam = {{ pyBool .randomiseJoinTeam }}
# If set to True, players might get teamswitched for balance when they go dead-dead
# Might switch anyone who is not SL/CO or on switch list
# Default is True
smb_balanceOnDeath = {{ pyBool .balanceOnDeath }}

# Keep same IP players on the same team
# Default is False
smb_antiGhost = {{ pyBool .antiGhost }}

# Disallow mid round !switches
# Default is False (off)
smb_disableSwitchNow = {{ pyBool .disableSwitchNow }}

# Force players onto the same team on reconnect
# Default is True (on)
smb_forceRejoinTeamswitch = {{ pyBool .forceRejoinTeamswitch }}

#
#
{{- end }}
# ==============================================================================
# LOGS SETTINGS
#
# Date format for logging
# Default is "%Y%m%d_%H%M"
log_date_format = "%Y-%m-%d %H:%M"
#
# Time format for logging
# Default is "%H:%M:S"
log_time_format = "%H:%M:%S"
#
# Enable/disable chat logging
# Default is True
log_chat = True
#
# Enable/disable player connect/disconnect logging. Written into chatlog
# Default is True
log_connects = True
#
# Enable/disable player team switch logging. Written into chatlog
# Default is False
log_changeTeam = False
#
# Chat log file name.
# Default is "chatlog_%Y-%m-%d_%H%Ms.txt"
log_chat_file = "chatlog_%Y-%m-%d_%H%M.txt"
#
# Chat log file name.
# Default is "admin/logs"
log_chat_path = "admin/logs"
#
# Enable/disable teamkill logging. Saved in chatlog
# Default is True
log_teamkills = True
#
# Enable/Disable logging of players who play from the same IP at the same time.
# Default is True
log_coincident_IPs = True
#
# Enable/disable kill logging. Saved in chatlog
# Default is False
log_kills = False
#
# Enable/disable admin command logging. Saved in continues file.
# Default is True
log_admins = True
#
# Enable/disable logging of bans. Saved in continues file.
# Default is True
log_bans = True
#
# Enable/disable logging of tickets on round end. Saved in continues file.
# Default is True
log_tickets = True


#
# Filename of the admin log file
# Default is "ra_adminlog.txt"
log_admins_file = "ra_adminlog.txt"
#
# Path relative to PR root (not mod root) of admin log file
# Default is "admin/logs"
log_admins_path = "admin/logs"
#
# Filename of the admin log file
# Default is "banlist_info.log"
log_bans_file = "banlist_info.log"
#
# Path relative to PR root (not mod root) of ban log file. [MOD] gets replaced by current mod directory
# Default is "[MOD]/settings/"
log_bans_path = "[MOD]/settings/"
#
# Filename of the coincident IP address file
# default is "IPcoincidences.log"
log_IP_coincidence_file = "IPcoincidences.log"
#
# Path relative to PR root (not mod root) of IP coincidence log. [MOD] gets replaced by current mod directory
# Default is "[MOD]/settings/"
log_IP_coincidence_path = "[MOD]/settings/"
#
# Filename of the tickets log file
# Default is "tickets.log"
log_tickets_file = "tickets.log"
# Path relative to PR root (not mod root) of tickets log file
# Default is "admin/logs"
log_tickets_path = "admin/logs"
#
#
#
# ==============================================================================
# ANNOUNCER SETTINGS
{{- with .Values.announcer }}
#
# Tip: Text preceded by §C1001 will make it orange. §3 makes it big. §C1001§3 makes it orange and big.
# Enable/disable announcer.
# Default is True
ann_enabled = {{ pyBool .enabled }}
#
# Enable/disable dislpaying a message when a player joins the server (spawns for the first time).
# Default is True
ann_joinMessageEnabled = {{ pyBool .joinMessageEnabled}}
#
# Message to send to the player (this is a PM).
# If you want the message to contain a name, make sure to insert [playername] somewhere.
ann_joinMessage = {{ .joinMessage | quote }}
#
# If True, a message is displayed when a player disconnects from the server.
# Default is False
ann_disconnectMessageEnabled = {{ pyBool .disconnectMessageEnabled }}
#
# This message is displayed when a player disconnects from the server.
ann_disconnectMessage = {{ .disconnectMessage }}
#
# Enable/disable displaying timed messages.
# Default is False
ann_timedMessagesEnabled = {{ pyBool .timedMessagesEnabled }}
#
# Timed servermessages.
# Usage: Interval: Message
ann_timedMessages = {
    {{- range .timedMessages }}
    {{ .interval }}: {{ if .msg }}{{ .msg | quote }}{{else if .longMsg }}"""{{ .longMsg }}"""{{ end }},
    {{- end }}
}
#
#
{{- end }}
# ==============================================================================
# ADMIN SETTINGS
{{- with .Values.admin }}
#
# Enable/disable admincommands.
# Default is True
adm_enabled = {{ pyBool .enabled }}
#
# Enable/disable to show PRISM users in !admins command.
# Default is True
adm_show_prism = {{ pyBool .showPrism }}
#
# If true, as soon as the last admin leaves autoadmin will be activated.
# Default is False
adm_autoAdmin = {{ pyBool .autoAdmin }}
#
# If true, admins will get notified about players switching teams.
# Default is False
adm_notifyChangeTeam = {{ pyBool .notifyChangeTeam }}
#
# If true, send a message on each teamkill containing
# weapon and distance between the players
# Default is True
adm_sendTeamKillMessage = {{ pyBool .sendTeamKillMessage }}
#
# If true, will notify all admins that a player has connected with
# the same IP as another player currently on the server.
# Default is True
adm_notifySameIP = {{ pyBool .notifySameIP }}
#
# Time in minutes a player is temp banned (if you use the temp-ban command, normal ban is forever!).
# Note: if the server is restarted, the ban is lifted.
# Default is 180
adm_banTime = {{ .banTime }}
#
# Admin command symbol.
# Default is !
adm_commandSymbol = {{ .commandSymbol | quote }}
#
# Symbol to indicate you want to target player ID instead of name.
# Default is @
adm_idPrefix = {{ .idPrefix | quote }}
#
# Symbol to indicate you want to target a squad instead of name.
# Default is #
adm_squadPrefix = {{ .squadPrefix | quote }}
#
# Define the maximum altitude (used in the fly-command).
# Default is 1000
adm_maxAltitude = {{ .maxAltitude }}
#
#
# Time how long a mapvote will take.
# Default is 60
adm_mvoteDuration = {{ .mvoteDuration }}
#
# Time between the !mvote message pops up in the upper left corner.
# Default is 10
adm_mvoteRecurrence = {{ .mvoteRecurrence }}
#
# The maximum number of ropes a player can have active
# Default is 10
adm_maxRopes = {{ .maxRopes }}
#
# If !givelead should work in coop
# Default is true
adm_coopGiveLead = True
#
# Array in which the names of the administrators will be saved.
# Make sure there are NO duplicates!
adm_adminHashes = {
    # "ENTER_ADMIN_HASHES_HERE":    0,    # comment , Superadmin
    {{- range .adminHashes }}
    {{ .hash | quote}}: {{ .level }}, # {{ .name }}
    {{- end }}
}
#
# Array in which the liteadmins are saved.
# Leave it empty if you dont want to use this functionality.
adm_liteAdminHashes = {
    # "ENTER_LITE_ADMIN_HASHES_HERE":    2,    # comment , Liteadmin
    {{- range .liteAdminHashes }}
    {{ .hash | quote}}: {{ .level }}, # {{ .name }}
    {{- end }}
}
#
# Command aliases
# Specify aliases for long commands here.
adm_commandAliases = {
{{- if .commandAliases }}
    {{- range $command, $aliases := .commandAliases }}
        {{- range $aliases }}
    {{ . | quote }}: {{ $command | quote }},
        {{- end }}
    {{- end }}
{{- else }}
    "k":        "kick",
    "tb":       "tempban",
    "rb":       "roundban",
    "b":        "ban",
    "r":        "report",
    "rp":       "reportplayer",
    "w":        "warn",
    "s":        "say",
    "m":        "message",
    "st":       "sayteam",
    "ub":       "unban",
    "mvote":    "mapvote",
    "lastmap":  "history",
    "lastmaps": "history",
    "ug":       "ungrief",
{{- end }}
}
#
# Rights management.
# The lower the powerlevel, the more power one has.
# Two powerlevels are defined by default, but you can define as many as you want.
{{- with .commandLevels }}
adm_adminPowerLevels = {
    # 0: Superadmin, can do everything.
    # 1: Moderator, can't do everything.
    # 2: Meant to use for liteadmins.
    # 777: used for commands that everyone can use.
    #
    # Reload the current map.
    # Default is 1
    "reload":     {{ .reload }},
    #
    # Run the next map.
    # Default is 2
    "runnext":    {{ .runnext }},
    #
    # Set a next map.
    # Default is 2
    "setnext":    {{ .setnext }},
    #
    # Initializes a global server mapvote between 2-3 maps.
    # People can then vote with either writing 1,2 or 3 in chat.
    # All admins will receive a message which map won after a configured time.
    # Default is 2
    "mapvote":    {{ .mapvote }},
    #
    # Sends a message to a specified player.
    # Similar to !warn but without the STOP DOING THAT and is private.
    "message":    {{ .message }},
    #
    # Diplays the ticket count of both teams.
    "tickets":    {{ .tickets }},
    #
    # Player control
    # Ban a player.
    # Default is 1
    "ban":        {{ .ban }},
    #
    # Ban a player for a specified amount of time.
    # Default is 1
    "timeban":    {{ .timeban }},
    #
    # Ban a player for a round
    # Default is 1
    "roundban":    {{ .roundban }},
    #
    # Unbans the latest banned player.
    # Default is 1
    "unban":      {{ .unban }},
    #
    # Send a player up in the air.
    # Default is 0
    "fly":        {{ .fly }},
    #
    # Retrieves the hash of certain player.
    # Default is 2
    "hash":       {{ .hash }},
    #
    # Kick a player.
    # Default is 2
    "kick":       {{ .kick }},
    #
    # Kill a player.
    # Default is 1
    "kill":       {{ .kill }},
    #
    # Resign a player from being squad leader or commander.
    # Default is 2
    "resign":     {{ .resign }},
    #
    # Resign a player from being squad leader or commander.
    # Default is 2
    "resignall":     {{ .resignall }},
    #
    # Teamswitch a player.
    # Default is 2
    "switch":     {{ .switch }},
    #
    # Temporary ban a player (basically extended 'kick').
    # Default is 1
    "tempban":    {{ .tempban }},
    #
    # Warn a player.
    # Default is 2
    "warn":       {{ .warn }},
    #
    # Text messages
    # Show help about commands.
    # Default is 2
    "help":       {{ .help }},
    #
    # Send a message to everybody.
    # Default is 2
    "say":        {{ .say }},
    #
    # Same as !s, but for one team only.
    # Default is 2
    "sayteam":    {{ .sayteam }},
    #
    # Server- and Pythoncommands
    # Enable/disable smart balancing (ab = autobalance, people call it that).
    # Default is 1
    "ab":         {{ .ab }},
    # Reload some settings.
    # Default is 2
    "init":       {{ .init }},
    #
    #
    # Swap the teams.
    # Default is 0
    "swapteams":  {{ .swapteams }},
    #
    #
    # Scramble the teams.
    # Default is 0
    "scramble":  {{ .scramble }},
    #
    #
    # Stops the server.
    # Default is 1
    "stopserver": {{ .stopserver }},
    #
    # Enable/disable autoadmin.
    # Default is 1
    "aa":         {{ .aa }},
    #
    # Displays a list of the last n maps that were played on the server (Configurable count)
    # Default is 2
    "history":    {{ .history }},
    #
    # Open commands
    # Please note that 777 is a fixed value for "open" commands!
    # This means everybody on the server can use them.
    # Returns a list of online admins.
    # Default is 777
    "admins":     {{ .admins }},
    #
    # Report a player.
    # Default is 777
    "reportplayer":    {{ .reportplayer }},
    #
    # Send a message to the admins.
    # Default is 777
    "report":     {{ .report }},
    #
    # Shows the serverrules.
    # Default is 777
    "rules":      {{ .rules }},
    #
    # Show the next map.
    # Default is 777
    "shownext":   {{ .shownext }},
    #
    # Give squad lead to another player.
    # Default is 777
    "givelead":   {{ .givelead }},
    #
    # shows if Battlerecorder is activated and which quality its running with.
    # Default is 777
    "br":         {{ .br }},
    #
    # Displays a link to the server website.
    # Default is 777
    "website":    {{ .website }},
    #
    # Random number utility, return a random int 0/1 by default
    # or in the range [0,m] if m is a supplied positive integer
    # Default is 777
    "flip":       {{ .flip }},
    # Ungrief (TODO)
    #
    #
    "ungrief":    {{ .ungrief }},
    #
    #
    # Reset squads - may fix squad bug
    "resetsquads": {{ .resetsquads }},
    #
    # Server Entrance control
    # handle whitelist and join permissions to the server
    "ec": {{ .ec }},
    #
    # Player info
    # Print IP, Account ID ("hash"), level, and whitelist status of a player
    "info": {{ .info }},
    #
    # Player idle time
    # Print 5 longest afk players
    "showafk": {{ .showafk }},
    #
    #
    # Ban a player by hash
    "banid": {{ .banid }},
    #
    #
    # Temp Ban a player by hash
    "timebanid": {{ .timebanid }},
    #
    #
    # Unban a player by hash
    "unbanid": {{ .unbanid }},
    #
    #
    # Unban a player by name
    "unbanname": {{ .unbanname }},
    #
    #
    # Make a player leader of their squad
    "assignlead": {{ .assignlead }},
    #
    #
    {{- range $name, $command := $.Values.extraCommands }}
        {{- if $command.enabled }}
    {{ $name | quote}}: {{ $command.powerLevel }}
        {{- end }}
    {{- end }}

}
{{- end }}
#
# This text will be sent to the player issueing !website.
adm_website = {{ .website | quote }}
#
# Predefined reasons, so you only have to type a keyword as a reason.
# The script will automatically replace it with the reason you enter below.
# Note: only use lowercase in the reason "keys", you can use all cases in the reason itself.
adm_reasons = {
{{- if .reasons }}
    {{- range $short, $reason := .reasons }}
    {{ $short | quote }}: {{ $reason | quote }},
    {{- end }}
{{- else }}
    "afk":      "You were AFK!",
    "dis":      "You're bringing the game into disrepute. Be gone, foul demon!",
    "fail":     "You are a failure",
    "steal":    "Asset stealing",
    "tk":       "Stop teamkilling!",
    "lang":     "Watch your language!",
    "language": "Keep your language clean!",
    "locked":   " Open your locked squad!",
    "solo":     "Your vehicle is not properly manned!",
    "spam":     "Stop chat-spamming!",
{{- end }}
}
#
# Enable displaying rules.
# Default is False
adm_rulesEnabled = {{ pyBool .rulesEnabled }}
#
# Array in which the rules of the server will be saved.
# Five rules is the max, the player can't see more than five lines. Remove lines if desired.
adm_rules = [
{{- range .rules }}
    {{ . | quote }},
{{- end }}
]
#
# Modify this if you want to add additional maps. You do NOT need to add official maps.
# Example:
# "asad_khal|gpm_cq|inf",
# "asad_khal|gpm_cq|alt",
# "asad_khal|gpm_cq|std",
# "asad_khal|gpm_cq|lrg"
adm_mapListCustom = [
    # "mapname|gamemode|layer",
]

# Give reserved slots for the following groups
# available groups: ["CON", "DEV", "RETIRED", "TESTER"]
adm_devReservedSlots = ["CON", "DEV", "RETIRED", "TESTER"]
{{- end }}

# PRISM: See realitymod.com/prism for help.
{{- with .Values.prism }}
rcon_enabled = {{ pyBool .enabled }}

# Rcon welcome message
rcon_welcome = '{{ .welcome }}'

# Powerlevels for the commands
{{- with .commandPowerLevels }}
rcon_commandPowerLevels = {
    # PRISM user management
    'getusers':        {{ .getusers }},
    'adduser':         {{ .adduser }},
    'changeuser':      {{ .changeuser }},
    'deleteuser':      {{ .deleteuser }},
    # Game management
    'mapplayers':      {{ .mapplayers }},
    'mapgameplay':     {{ .mapgameplay }},
    'readbanlist':     {{ .readbanlist }},
    'setbanlist':      {{ .setbanlist }},
    'readmaplist':     {{ .readmaplist }},
    'setmaplist':      {{ .setmaplist }},
    'apiadmin':        {{ .apiadmin }},
    # Do not change these
    'listplayers':     777,
    'serverdetails':   777,
    'gameplaydetails': 777,
}
{{- end }}
{{- end }}

# ACSYS Asset Claim SYStem (commented out for now, future patch)
acsys_enable = False  # Enforce squads in acsys_assets name uniqueness
# enforce a minimum number of players before using assets, set to 0 to disable
acsys_low_pop_limit = 0
# c.VEHICLE_TYPE_UNKNOWN
# c.VEHICLE_TYPE_ARMOR  # TANK
# c.VEHICLE_TYPE_AAV  # Anti Air
# c.VEHICLE_TYPE_APC
# c.VEHICLE_TYPE_IFV
# c.VEHICLE_TYPE_JET
# c.VEHICLE_TYPE_HELI
# c.VEHICLE_TYPE_HELIATTACK
# c.VEHICLE_TYPE_TRANSPORT
# c.VEHICLE_TYPE_RECON
# c.VEHICLE_TYPE_STATIC
# c.VEHICLE_TYPE_SOLDIER
# c.VEHICLE_TYPE_ASSET
# c.VEHICLE_TYPE_SHIP
# c.VEHICLE_TYPE_TURBOPROP
# c.VEHICLE_TYPE_AFV # open top shitboxes Armoured Fighting Vehicle
# c.VEHICLE_TYPE_ALC  # Armoured Logistics Carrier
# c.VEHICLE_TYPE_UAV
acsys_assets = {
    "APC": {
        "squadname_contains": ["APC"],  # squad contains this string
        "squad_controls": [c.VEHICLE_TYPE_APC, c.VEHICLE_TYPE_IFV],  # _type_
        "exclude": [],  # templateName string list to exclude
    },
    "TANK": {
        "squadname_contains": ["TANK"],
        "squad_controls": [c.VEHICLE_TYPE_ARMOR],
        "exclude": [],
    },
    "CAS": {
        "squadname_contains": ["CAS"],
        "squad_controls": [c.VEHICLE_TYPE_JET, c.VEHICLE_TYPE_HELIATTACK],
        "exclude": [],
    },
    "TRANS": {
        "squadname_contains": ["TRANS"],
        "squad_controls": [c.VEHICLE_TYPE_HELI],
        "exclude": [],
    },
}
acsys_low_pop = {  # additional types and template names to exclude from low pop servers
    "vehicle_type": [c.VEHICLE_TYPE_APC, c.VEHICLE_TYPE_IFV, c.VEHICLE_TYPE_ARMOR,
                     c.VEHICLE_TYPE_JET, c.VEHICLE_TYPE_HELIATTACK, c.VEHICLE_TYPE_AAV],
    "include": ["civ_trk_dumpster_bomber", "civ_atm_technical"],
}

# Prism TCP port to listen on
rcon_port = {{ .Values.portPrism }}


# Entrance control
{{- with .Values.entranceControl }}
# Possible values are 0, 1, 2
# 0 Means everyone
# 1 Means some trust
# 2 Means high trust
ec_minimumTrust = {{ .minimumTrust }}

# Allow VAC banned users to join the server if they're not on whitelist
ec_allowVacBanned = {{ pyBool .allowVacBanned }}
{{- end }}

# Report this as your external IP to the master server.
# Do not touch unless you have multiple interfaces
sv_externalIP = {{ .Values.externalIP | quote }}

# Shared secret between gameserver and murmur. Prevents players that are not on the server from speaking on mumble.
# Gameserver and murmur should set this to the same secret value.
# (on murmur, set at PRMurmur\mumo\modules-enabled\prbf2.ini, at [prbf2]/secret)
# You must make sure the clock of the gameserver host and the murmur host are synchronized (different timezones are considered)
# Does nothing if the feature is not enabled on murmur.
mum_mumbleSecret = {{ .Values.murmurSecret | quote }}

# Country flag to display on PRSPY.
# Must be 2 letters of the country, such as "US" or "RU".
sv_countryflag = {{ .Values.countryflag | quote }}

# Record admin and player squad chat that is prefixed with ! into tracker files
track_commandchat = True

# Display the name of the admin who kicked or banned a player to the player along with the kick reason.
display_kickAdmin = False

testscramble = True

# Prevent these IDs from being caught in related bans, useful for genuinely shared computers etc
# whitelisted_player_ids = ["77ff5fecc0e648249bd6b01fdba02242"]
whitelisted_player_ids = []
