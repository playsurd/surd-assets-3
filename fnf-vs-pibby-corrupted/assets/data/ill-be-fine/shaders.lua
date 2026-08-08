Time = 1
CAamount = 0

function onCreatePost()
setSpriteShader("Shader1", "Glitchy")
setSpriteShader("Shader2", "shift glitch")

makeLuaSprite("Shader3")
setSpriteShader("Shader3", "chrom")

runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);

game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);
		]])

setShaderFloat("Shader1", "AMT", 0)
setShaderFloat("Shader1", "SPEED", 0)

setShaderFloat("Shader2", "offsetIntensity", 0)
setShaderFloat("Shader2", "noiseQuality",100)

setShaderFloat("Shader3", "amount", 0)
end


amount = 0
function onUpdatePost()
        setShaderFloat('Shader3', "amount", amount)
end

function onEvent(n,v1)
if n == 'AddChrom' then
amount = amount + v1
end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'glitch_note' then
        amount = 0.5
    end
end

function boundTo(value, min, max)
return math.max(min, math.min(max, value))
end
function math.lerp(from,to,i)
return from+(to-from)*i
end


function onUpdate(elapsed)
amount = math.lerp(amount, CAamount + 0.000001, boundTo(elapsed * 10 / Time, 0, 500));
end