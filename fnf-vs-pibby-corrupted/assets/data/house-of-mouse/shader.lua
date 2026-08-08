function onCreatePost()
makeLuaSprite("Shader3")
setSpriteShader("Shader3", "old film")


runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);

game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);

game.camOther.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);

		]])

addHaxeLibrary("ShaderFilter1", "openfl.filters")
end


function onUpdatePost()
setShaderFloat("Shader3", "iTime", os.clock())

end