**Server Password By FAXES**

**About**
This resource gives you (the server owner) the ability to add a password to your FiveM server. This can be used for development servers, white-listed servers, or for anything else! This gives the user that option to make their life.

**In the Download**
  >__resource.lua
  config.lua
  client/main.lua
  server/config.lua
  server/main.lua
  locales/locales.lua
  locales/en.lua


**Pictures**

http://faxes.zone/imagebanks/y240mr.png
http://faxes.zone/imagebanks/285rex.png

<hr>

**Features**
- Server-side password for extra security (server/config.lua: Config.password)
- Kicks when invalid password is entered
- String must be matched (case wise)
- Countdown so if the password is not entered in *x* seconds the player is kicked (server/config.lua: Config.entryTimeout)
- Temp-ban system when a player is kicked for invalid password attempts (configurable time, server/config.lua: Config.invalidPasswordTimeout)
- Time remaining shown in "ban" message when player tries to reconnect
- Multiple password entry attempts, enforced by server (server/config.lua: Config.initialAttempts)
- Bypass ACE permission system
- Localization support (locales/ and /config.lua: Config.Locale)

**Changelogs**
[1.1](https://forum.fivem.net/t/release-server-password-make-your-server-secure-and-scum-free-1-0/180499/34)

**Requirements**
None. This is a standalone script.

**Downloads:**
* [Download via Github](https://github.com/FAXES/ServerPassword)
* <a class="attachment" href="http://faxes.zone/files/fax-serverpass/1.1.rar">Or via Direct Download</a>
**If you use this script it is highly suggested to put "Locked Server" into your server name**


**Installation**
Place in your resources folder, just like any other resource.


If you have any issues or comments please put them below. :christmas_tree:

**Original Topic**
https://forum.fivem.net/t/release-server-password-make-your-server-secure-and-scum-free-1-1/180499
