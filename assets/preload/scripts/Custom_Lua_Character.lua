-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz
function onCreate()
	makeAnimationList();
	makeOffsets();
	
	makeAnimatedLuaSprite('tricky', 'characters/tricky', 1100, 100);
	addAnimationByPrefix('tricky', 'idle', 'tricky idle', 24, false);
	addAnimationByPrefix('tricky', 'singLEFT', 'tricky right', 24, false);
	addAnimationByPrefix('tricky', 'singDOWN', 'tricky down', 24, false);
	addAnimationByPrefix('tricky', 'singUP', 'tricky up', 24, false);
	addAnimationByPrefix('tricky', 'singRIGHT', 'tricky left', 24, false);
	
	scaleLuaSprite('tricky', 1.8, 1.8)
	updateHitbox('tricky')
	setProperty('tricky.flipX', true);
	addLuaSprite('tricky', false);

	playAnimation('tricky', 0, true);
end

animationsList = {}
holdTimers = {tricky = -1.0};
noteDatas = {tricky = 0};
function makeAnimationList()
	animationsList[0] = 'idle';
	animationsList[1] = 'singLEFT';
	animationsList[2] = 'singDOWN';
	animationsList[3] = 'singUP';
	animationsList[4] = 'singRIGHT';
end

offsetstricky = {};
function makeOffsets()
	offsetstricky[0] = {x = 0, y = 0}; --idle
	offsetstricky[1] = {x = 0, y = 0}; --left
	offsetstricky[2] = {x = -28, y = 0}; --down
	offsetstricky[3] = {x = -47, y = 20}; --up
	offsetstricky[4] = {x = -44, y = 0}; --right
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Tricky Sing' then
		if not isSustainNote then
			noteDatas.tricky = direction;
		end	
	characterToPlay = 'tricky'
	animToPlay = noteDatas.tricky;
	holdTimers.tricky = 0;
			
	playAnimation(characterToPlay, animToPlay, true);
	end
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.tricky >= 0 then
		holdTimers.tricky = holdTimers.tricky + elapsed;
		if holdTimers.tricky >= holdCap then
			playAnimation('tricky', 0, false);
			holdTimers.tricky = -1;
		end
	end
end

function onCountdownTick(counter)
	beatHitDance(counter);
end

function onBeatHit()
	beatHitDance(curBeat);
end

function beatHitDance(counter)
	if counter % 2 == 0 then
		if holdTimers.tricky < 0 then
			playAnimation('tricky', 0, false);
		end
	end
end

function playAnimation(character, animId, forced)
	-- 0 = idle
	-- 1 = singLEFT
	-- 2 = singDOWN
	-- 3 = singUP
	-- 4 = singRIGHT
	animName = animationsList[animId];
	--debugPrint(animName);
	if character == 'tricky' then
		objectPlayAnimation('tricky', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
		setProperty('tricky.offset.x', offsetstricky[animId].x);
		setProperty('tricky.offset.y', offsetstricky[animId].y);
	end
end