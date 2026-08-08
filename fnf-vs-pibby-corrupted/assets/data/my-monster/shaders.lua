function onCreatePost()
makeLuaSprite("Shader3")
setSpriteShader("Shader3", "CameraGlitch")
setShaderBool('Shader3','vignetteOn',true)
setShaderBool('Shader3','vignetteMoving',true)

runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader3").shader)]);

game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader3").shader)]);

		]])
end

function onUpdatePost()
    if curStep < 1024 then
    setShaderFloat('Shader3','iTime',os.clock())
    end
end


function onStepHit()
    if curStep == 1024 then
makeLuaSprite("Shader3")
setSpriteShader("Shader3", "inverter")
setSpriteShader("Shader1", "Glitchy")
setSpriteShader("Shader2", "shift glitch")

runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);

game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);
		]])

setShaderFloat("Shader1", "AMT", 0)
setShaderFloat("Shader1", "SPEED", 0)

setShaderFloat("Shader2", "offsetIntensity", 0)
setShaderFloat("Shader2", "noiseQuality",100)

setShaderInt("Shader3", "invert", 0)
end
end

function opponentNoteHit(id, dir, noteType)
if noteType == 'glitch_note' then
setShaderFloat("Shader2", "noiseQuality", 50)
setShaderInt("Shader3", "invert", 1)
runTimer('remove', 0.1)
end
end

function onTimerCompleted(t)
if t == 'remove' then
setShaderFloat("Shader2", "offsetIntensity", 0)
setShaderInt("Shader3", "invert", 0)
end
end