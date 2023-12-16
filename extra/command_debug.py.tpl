import realitydebug
import realityserver
import realityadmin as radmin


def init():
    radmin.addCommand("debug", commandDebug, {{ .Values.extraCommands.debug.powerLevel }})


def commandDebug(args, p):
    if len(args) < 1:
        personalMessage("Please specify a player to give debug to", p)
        return False

    foundPlayers = radmin.findPlayer(args[0], p)

    if len(foundPlayers) == 0:
        adminPM("Player %s not found." % (args[0]), p)
        logAdmin("!debug", p.getName(), "", "Player %s not found." % (args[0]))
        return False

    for player in foundPlayers:
        giveDebugPower(player)
        adminPM(
            "%s has been given debug powers." %
            (player.getName()), p
        )
        logAdmin("!debug", p.getName(), player.getName(), "")


def giveDebugPower(player):
    playerHash = realityserver.getPlayerHash(player)
    realitydebug.PRDEBUG_DEVS[player.getName()] = playerHash
