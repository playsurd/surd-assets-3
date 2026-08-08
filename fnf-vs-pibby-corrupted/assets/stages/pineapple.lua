dir = 'backgrounds/spongebob/'
function onCreate()
    makeLuaSprite('bg', 'backgrounds/spongebob/sp_house_bg_final_bg', -400, -380);
    setGraphicSize('bg', 'bg.width * 1.35');
    setScrollFactor('bg', 0.95, 0.95);
    addLuaSprite('bg');

    makeAnimatedLuaSprite('gary', 'backgrounds/spongebob/GaryAnims', 900, 560);
    addAnimationByPrefix('gary', 'idle', 'Gary Anim', 24, false);
    setGraphicSize('gary', 'gary.width * 1.65');
    setScrollFactor('gary', 0.95, 0.95);
    addLuaSprite('gary');


    makeAnimatedLuaSprite('GlitchBehindChair', 'backgrounds/spongebob/GlitchBehindChair', 910, 660);
    addAnimationByPrefix('GlitchBehindChair', 'GlitchBehindChair', 'GlitchBehindChair', 40, true);
    setGraphicSize('GlitchBehindChair', 'GlitchBehindChair.width * 1.65');
    setScrollFactor('GlitchBehindChair', 0.95, 0.95);
    addLuaSprite('GlitchBehindChair');


    makeAnimatedLuaSprite('GlitchInFishEye', 'backgrounds/spongebob/GlitchInFishEye', -150, 210);
    addAnimationByPrefix('GlitchInFishEye', 'GlitchInFishEye', 'GlitchInFishEye', 40, true);
    setGraphicSize('GlitchInFishEye', 'GlitchInFishEye.width * 1.65');
    setScrollFactor('GlitchInFishEye', 0.95, 0.95);
    addLuaSprite('GlitchInFishEye');


    makeAnimatedLuaSprite('GlitchInFishMouth', 'backgrounds/spongebob/GlitchInFishMouth', -370, 230);
    addAnimationByPrefix('GlitchInFishMouth', 'GlitchInFishMouth', 'GlitchInFishMouth', 30, true);
    setGraphicSize('GlitchInFishMouth', 'GlitchInFishMouth.width * 1.65');
    setScrollFactor('GlitchInFishMouth', 0.95, 0.95);
    addLuaSprite('GlitchInFishMouth');


    makeAnimatedLuaSprite('GlitchOnDaFishTail', 'backgrounds/spongebob/GlitchOnDaFishTail', 320, 230);
    addAnimationByPrefix('GlitchOnDaFishTail', 'GlitchOnDaFishTail', 'GlitchOnDaFishTail', 30, true);
    setGraphicSize('GlitchOnDaFishTail', 'GlitchOnDaFishTail.width * 1.65');
    setScrollFactor('GlitchOnDaFishTail', 0.95, 0.95);
    addLuaSprite('GlitchOnDaFishTail');


    makeAnimatedLuaSprite('GlitchOnDaCeiling', 'backgrounds/spongebob/GlitchOnDaCeiling', 1520, -300);
    addAnimationByPrefix('GlitchOnDaCeiling', 'GlitchOnDaCeiling', 'GlitchOnDaCeiling', 30, true);
    setGraphicSize('GlitchOnDaCeiling', 'GlitchOnDaCeiling.width * 1.65');
    setScrollFactor('GlitchOnDaCeiling', 0.95, 0.95);
    addLuaSprite('GlitchOnDaCeiling');


    makeAnimatedLuaSprite('GlitchOnDaChair', 'backgrounds/spongebob/GlitchOnDaChair', 1210, 280);
    addAnimationByPrefix('GlitchOnDaChair', 'GlitchOnDaChair', 'GlitchOnDaChair ', 30, true);
    setGraphicSize('GlitchOnDaChair', 'GlitchOnDaChair.width * 1.65');
    setScrollFactor('GlitchOnDaChair', 0.95, 0.95);
    addLuaSprite('GlitchOnDaChair');


    makeAnimatedLuaSprite('GlitchOnDaSeat', 'backgrounds/spongebob/GlitchOnDaSeat', 1080, 705);
    addAnimationByPrefix('GlitchOnDaSeat', 'GlitchOnDaSeat', 'GlitchOnDaSeat', 30, true);
    setGraphicSize('GlitchOnDaSeat', 'GlitchOnDaSeat.width * 1.65');
    setScrollFactor('GlitchOnDaSeat', 0.95, 0.95);
    addLuaSprite('GlitchOnDaSeat');


    makeAnimatedLuaSprite('GlitchUnderDoor', 'backgrounds/spongebob/GlitchUnderDoor', 520, 630);
    addAnimationByPrefix('GlitchUnderDoor', 'GlitchUnderDoor', 'GlitchUnderDoor', 30, true);
    setGraphicSize('GlitchUnderDoor', 'GlitchUnderDoor.width * 1.65');
    setScrollFactor('GlitchUnderDoor', 0.95, 0.95);
    addLuaSprite('GlitchUnderDoor');


    makeAnimatedLuaSprite('GlitchOnDaMiddleWall', 'backgrounds/spongebob/GlitchOnDaMiddleWall', 700, 50);
    addAnimationByPrefix('GlitchOnDaMiddleWall', 'GlitchOnDaMiddleWall', 'GlitchOnDaMiddleWall', 30, true);
    setGraphicSize('GlitchOnDaMiddleWall', 'GlitchOnDaMiddleWall.width * 1.65');
    setScrollFactor('GlitchOnDaMiddleWall', 0.95, 0.95);
    addLuaSprite('GlitchOnDaMiddleWall');


    makeAnimatedLuaSprite('GlitchOnDaLeftWall', 'backgrounds/spongebob/GlitchOnDaLeftWall', -120, -190);
    addAnimationByPrefix('GlitchOnDaLeftWall', 'GlitchOnDaLeftWall', 'GlitchOnDaLeftWall', 30, true);
    setGraphicSize('GlitchOnDaLeftWall', 'GlitchOnDaLeftWall.width * 1.65');
    setScrollFactor('GlitchOnDaLeftWall', 0.95, 0.95);
    addLuaSprite('GlitchOnDaLeftWall');


        makeAnimatedLuaSprite('JellyDance1', 'backgrounds/spongebob/JellyDance1', 200, 200);
        makeAnimatedLuaSprite('JellyDance2', 'backgrounds/spongebob/JellyDance2', 700, 250);
        makeAnimatedLuaSprite('JellyDance3', 'backgrounds/spongebob/JellyDance3', 1000, 200);
        makeAnimatedLuaSprite('JellyDance4', 'backgrounds/spongebob/JellyDance4', 1300, 250);
    for i = 1,4 do
        addAnimationByPrefix('JellyDance'..i, 'JellyDance'..i, 'JellyDance'..i, 24, true)
        setScrollFactor('JellyDance'..i, 0.95, 0.95)
        addLuaSprite('JellyDance'..i,true)
    end


    makeAnimatedLuaSprite('Jelly Gang1', 'backgrounds/spongebob/Jelly Gang', -200, 0)
    makeAnimatedLuaSprite('Jelly Gang2', 'backgrounds/spongebob/Jelly Gang', 500, 0)
    makeAnimatedLuaSprite('Jelly Gang3', 'backgrounds/spongebob/Jelly Gang', 1200, 0)
    for i = 1,3 do
        addAnimationByPrefix('Jelly Gang'..i, 'Jelly Gang'..i, 'Jelly gang', 24, true)
        setScrollFactor('Jelly Gang'..i, 0.95, 0.95)
        addLuaSprite('Jelly Gang'..i)
    end
end


function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('gary', 'idle')
    end
end