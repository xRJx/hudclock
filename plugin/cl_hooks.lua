local PLUGIN = PLUGIN;
local Clockwork = Clockwork;
Clockwork.kernel = Clockwork.kernel;

-- Called when the client initializes.
function PLUGIN:Initialize()
	CW_CONVAR_HUDCLOCK = Clockwork.kernel:CreateClientConVar("cwHudClock", 0, true, true);
end;

-- Called when a PLUGIN ConVar has changed.
function PLUGIN:ClockworkConVarChanged()
	if (CW_CONVAR_HUDCLOCK:GetInt() == 1) then
		RunConsoleCommand("hudclock", "1");
	else
		RunConsoleCommand("hudclock", "0");
	end;
end;