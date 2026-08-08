local dir = 'backgrounds/Stevenbg/'--image direction support
function onCreate()
makeLuaSprite("sky",'backgrounds/Stevenbg/sky',-700, -500)
setScrollFactor("sky", 0.11, 0.11);
addLuaSprite("sky");


makeLuaSprite("clouds",'backgrounds/Stevenbg/clouds',-700, -500)
setScrollFactor("clouds", 0.11, 0.11);
addLuaSprite("clouds");


makeLuaSprite("moon",'backgrounds/Stevenbg/moon',-300, -500)
setScrollFactor("moon", 0.12, 0.12);
addLuaSprite("moon");


makeLuaSprite("water",'backgrounds/Stevenbg/water',-600, 140)
setScrollFactor("water", 0.28, 0.28);
scaleObject("water", 1, 1.9);
addLuaSprite("water");


makeAnimatedLuaSprite("clusterhand",'backgrounds/Stevenbg/clusterhand',-730, -265)
addAnimationByPrefix('clusterhand','idle', 'za hando glitch', 24);
setScrollFactor("clusterhand", 0.3, 0.3);
addLuaSprite('clusterhand')


makeLuaSprite("ground",'backgrounds/Stevenbg/ground',-1200,300)
setScrollFactor("ground", 0.97, 0.97);
scaleObject("ground", 1.4, 1.4, true);
addLuaSprite("ground");


makeAnimatedLuaSprite("lion", 'backgrounds/Stevenbg/lion', 1220, 55)
addAnimationByPrefix('lion', 'idle', 'lion', 24, false);
setScrollFactor("lion", 0.28,0.28);
addLuaSprite('lion')


makeAnimatedLuaSprite("stevensword",'backgrounds/Stevenbg/stevensword', 590, 135)
addAnimationByPrefix('stevensword','idle', 'sword glitch', 24);
addLuaSprite('stevensword')


makeAnimatedLuaSprite("goofyAhhDarkness",'backgrounds/Stevenbg/stevenbigpoolleft', -1300, 320)
addAnimationByPrefix('goofyAhhDarkness','idle', 'giant pool', 24);
scaleObject("goofyAhhDarkness", 1.4, 1.4, true);
addLuaSprite('goofyAhhDarkness')

end


function onBeatHit()--lion play idle animation on beat
if curBeat %2 == 0 then
playAnim('lion', 'idle', true)
end
end