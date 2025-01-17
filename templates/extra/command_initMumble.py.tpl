import realitydebug
import realityserver
import realityadmin as radmin


def init():
    radmin.addCommand("initMumble", commandInitMumble, {{ .Values.extraCommands.initMumble.powerLevel }})


def commandInitMumble(args, p):
    import realityconfig_admin as rasreload
    reload(rasreload)

    radmin.MumbleOTP.secret = rasreload.mum_mumbleSecret
