dir = 'backgrounds/ivashkaBG/second_song/'
function onCreate()
makeLuaSprite('sky', dir..'sky',-1000,-1000)
setScrollFactor("sky", 0.11, 0.11);
addLuaSprite('sky')

makeLuaSprite('boat', dir..'boatshit')
addLuaSprite('boat')


makeAnimatedLuaSprite('p1', dir..'pirate_1',1050,1470)

makeAnimatedLuaSprite('p2', dir..'pirate_2',1950,1580)

makeAnimatedLuaSprite('p3', dir..'pirate_3',2280,1700)


addLuaSprite('p3')

    for i = 1,3 do
        addAnimationByPrefix('p'..i, 'idle', 'pirate '..i..' idle',24,true)
        scaleObject('p'..i,1.4,1.4)
        addLuaSprite('p'..i)
    end

makeLuaSprite('pillars', dir..'pillars')
addLuaSprite('pillars')


makeAnimatedLuaSprite('fire', dir..'fire',730,900)
addAnimationByPrefix('fire', 'idle', 'fire',24,true)
scaleObject('fire',0.7,1)
addLuaSprite('fire')

makeLuaSprite('floor', dir..'floor',750,2300)
scaleObject('floor',1.6,2)
addLuaSprite('floor')

makeLuaSprite('hand', dir..'hand',1550,2300)
scaleObject('hand',3.2,3.2)
setProperty('hand.offset.x',0)
setProperty('hand.offset.y',0)
addLuaSprite('hand',true)
end

function onCreatePost()
    setProperty('hand.visible',false)
    setProperty('fire.visible',false)
    setProperty('floor.visible',false)
end


function onBeatHit()
    if curBeat %2 == 0 and getProperty('hand.visible') == true then
        setProperty('hand.y',2320)
        doTweenY('idh','hand',2300,1,'expoOut')
        shake = true
        runTimer('unshake',0.2)
    end
end


function onTimerCompleted(t)
    if t == 'unshake' then
        shake = false
        setProperty('hand.offset.x',0)
        setProperty('hand.offset.y',0)
    end
end



function onUpdatePost()
    if shake then
        setProperty('hand.offset.x',getRandomInt(-3,3))
        setProperty('hand.offset.y',getRandomInt(-3,3))
    end
end