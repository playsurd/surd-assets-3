-- CHANGE THE OFFSET VARIABLE FOR MORE OR LESS CAMERA MOVEMENT!!
local offset = 45
--
local function follow(data, mustPress, type)
	if type ~= "No Animation" and type ~= "Hey!" and type ~= "Hurt Note" and (gfSection or mustPress == nil or mustPress == mustHitSection) then
		local x, y, pitch = 0, 0, getPropertyFromClass("flixel.FlxG", "sound.music.pitch")
		if data ~= nil then
			if data == 0 then
				x = -offset
			elseif data == 1 then
				y = offset
			elseif data == 2 then
				y = -offset
			else
				x = offset
			end
			runTimer("coolCam", stepCrochet * (0.0011 / pitch) * getProperty((gfSection and "gf" or (mustPress and "boyfriend" or "dad")) .. ".singDuration"))
		else
			cancelTimer("coolCam")
		end
		local duration = 1.7 * getProperty("cameraSpeed") * pitch
		doTweenX("coolCamX", "camGame.targetOffset", x, duration, "quintOut")
		doTweenY("coolCamY", "camGame.targetOffset", y, duration, "quintOut")
	end
end
function onTimerCompleted(tag)
	if tag == "coolCam" then
		follow()
	end
end
function goodNoteHit(_, data, type)
	if not getProperty("isCameraOnForcedPos") then
		follow(data, true, type)
	end
end
function opponentNoteHit(_, data, type)
	if not getProperty("isCameraOnForcedPos") then
		follow(data, false, type)
	end
end
function noteMiss(_, _, type)
	if not getProperty("isCameraOnForcedPos") then
		follow(nil, true, type)
	end
end
function noteMissPress()
	noteMiss()
end
function onEvent(name, v1, v2)
	if name == "Camera Follow Pos" and (tonumber(v1) ~= 0 or tonumber(v2) ~= 0) then
		follow()
	end
end
