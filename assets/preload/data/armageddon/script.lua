function onCreate()
	addCharacterToList('hank-flipped', 'gf');
	setProperty('gf.visible', false)
	doTweenY('reset', 'gf', -1000, 0.01, 'linear')
	doTweenX('reset2', 'tricky', 2300, 0.01, 'linear')
end

function onStartCountdown()
	cameraSetTarget('dad')
end

function onMoveCamera(focus) --304 and 320
	if curBeat > 303 and curBeat < 320 and focus == 'gf' then
		setProperty('camFollow.y', 500)
		setProperty('camFollow.x', 1000)
	end
end

beatHitFuncs = {
	[158] = function()
	setProperty('gf.visible', true)
	doTweenY('he flying', 'gf', 100, 0.5, 'linear')
	doTweenAngle('SPEEEEEEEEEEEEEN', 'gf', 720, 0.6, 'linear')
	end,	
	[302] = function()
	doTweenX('aaaa', 'tricky', 1100, 0.5, 'linear')
	end,
	[318] = function()
	doTweenX('eeee', 'tricky', 2300, 0.5, 'linear')
	doTweenAngle('SPEEEEEEEEEEEEEN', 'tricky', 720, 0.6, 'linear')
	end,	
	[323] = function()
	doTweenY('he flying', 'gf', -1000, 0.5, 'linear')
	doTweenAngle('SPEEEEEEEEEEEEEN', 'gf', 720, 0.6, 'linear')
	end,	
	[324] = function()
	setProperty('gf.visible', false)
	end,
}

function onBeatHit()
	if beatHitFuncs[curBeat] then 
		beatHitFuncs[curBeat]()
	end
end
