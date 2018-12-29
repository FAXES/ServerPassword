Config.password = 'fax' -- Set server password here
Config.initialAttempts = 3
Config.invalidPasswordTimeout = 5 * 60 -- Wait time before the player can re-join. Change the first value Not the '* 60'. Default: 5 minutes

-- entry timeout in seconds. if no successful login before this timeout, player will be kicked. set to 0 to disable.
-- esx_identity's dialog takes focus first for new players, so if you're using it, you probably want this to be much higher than 30 seconds.
Config.entryTimeout = 30