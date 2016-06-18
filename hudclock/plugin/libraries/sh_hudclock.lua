
Clockwork.hudclock = Clockwork.kernel:NewLibrary("HudClock");

if (CLIENT) then

	-- A function to draw a clock on a player's HUD.
	function Clockwork.hudclock.HUDPaint()
		
		local player = LocalPlayer();
		if player:GetNetworkedInt("hudclock") == 0 then
			return
		end

		-- Box Rounding (has to be an even number).
		local CornerAA = 8;

		-- Color of the border.
		local BorderR = 0;
		local BorderG = 0;
		local BorderB = 0;
		local BorderA = 100;

		-- Color of the box.
		local BoxR = 50;
		local BoxG = 50;
		local BoxB = 50;
		local BoxA = 125;

		-- Variables for the in-game day/time.
		local timeString = Clockwork.time:GetString();
		local dayName = Clockwork.time:GetDayName();

		-- Length of the entire clock.
		local Width = 120;

		-- Variables for the day/time
		local msg = {};
		msg[1] = dayName..",";
		msg[2] = timeString;
		msg[3] = "Day               Time";
		msg[4] = "Day               Time";

		-- Font, height, width, etc...
		surface.SetFont("Default");
		local w = Width;
		local h = 3;
		local x = surface.ScreenWidth() - 150
		local y = surface.ScreenHeight() - 25

		-- Border
		draw.RoundedBox(CornerAA, x-7, y-12, w+24,h*6+8, Color(BorderR,BorderG,BorderB,BorderA));

		-- Main Box
		draw.RoundedBox(CornerAA, x-5, y-10, w+20,h*4+10, Color(BoxR,BoxG,BoxB,BoxA));


		-- Draw Text
		draw.SimpleText(msg[1], "Default", x+2, y-6, Color(255,255,255,210));

		-- Draw Text
		draw.SimpleText(msg[2], "Default", x+66, y-6, Color(255,255,255,210));

		-- Background Text
		draw.SimpleText(msg[3], "DefaultSmall", x+6, y-17, Color(0,0,0,255));

		-- Front Text
		draw.SimpleText(msg[4], "DefaultSmall", x+7, y-16, Color(255,255,255,255));
	end;
	hook.Add("HUDPaint", "Clockwork.hudclock.HUDPaint", Clockwork.hudclock.HUDPaint);

else

	-- A function to enable/disable the Hud Clock.
	function Clockwork.hudclock.Command(player, command, arguments)
		if not arguments[1] then
			if player:GetNetworkedInt("hudclock") == 1 then
				Clockwork.hudclock.Disable(player)
			else
				Clockwork.hudclock.Enable(player)
			end;
		elseif arguments[1] == "1" then
			Clockwork.hudclock.Enable(player)
		elseif arguments[1] == "0" then
			Clockwork.hudclock.Disable(player)
		end;
	end;
	concommand.Add("hudclock", Clockwork.hudclock.Command)

	-- Called when the Hud Clock is enabled.
	function Clockwork.hudclock.Enable(player)
		if (player:GetNetworkedInt("hudclock") == 1) then
			return
		end;
		player:SetNetworkedInt("hudclock", 1);
	end;

	-- Called when the Hud Clock is disabled.
	function Clockwork.hudclock.Disable(player)
		if (player:GetNetworkedInt("hudclock") == 0) then
			return
		end;
		player:SetNetworkedInt("hudclock", 0);
	end
end;