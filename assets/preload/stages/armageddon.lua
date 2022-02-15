function onCreate()
	--Stage thingies
	makeLuaSprite('bg', 'stageback', -600, -200)
	makeLuaSprite('stageFront', 'stagefront', -650, 600)
	makeLuaSprite('stagelight1', 'stage_light', -125, -100)
	makeLuaSprite('stagelight2', 'stage_light', 1225, -100)
	makeLuaSprite('stageCurtains', 'stagecurtains', -500, -300)
	
	--Scroll Factor
	setScrollFactor('bg', 0.9, 0.9)
	setScrollFactor('stagelight1', 0.9, 0.9)
	setScrollFactor('stagelight2', 0.9, 0.9)
	setScrollFactor('stageCurtains', 1.1, 1.1)
	
	--Scaling
	scaleLuaSprite('stageFront', 1.1, 1.1)
	scaleLuaSprite('stagelight1', 1.1, 1.1)
	scaleLuaSprite('stagelight2', 1.1, 1.1)
	scaleLuaSprite('stageCurtains', 0.9, 0.9)
	
	--Updating Hitboxes
	updateHitbox('stageFront')
	updateHitbox('stagelight1')
	updateHitbox('stagelight2')
	updateHitbox('stageCurtains')
	
	--Setting Properties
	setProperty('stagelight2.flipX', true);
	
	--Layering
	setObjectOrder('bg', 1)
	setObjectOrder('stageFront', 2)
	setObjectOrder('stagelight1', 3)
	setObjectOrder('stagelight2', 4)
	setObjectOrder('tricky', 5)
	setObjectOrder('stageCurtains', 6)
	setObjectOrder('gfGroup', 7)
	setObjectOrder('dadGroup', 8)
	setObjectOrder('boyfriendGroup', 9)
	
	--Adding sprites
	addLuaSprite('bg', false)
	addLuaSprite('stageFront', false)
	addLuaSprite('stagelight1', false)
	addLuaSprite('stagelight2', false)
	addLuaSprite('stageCurtains', false)
end	