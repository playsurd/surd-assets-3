-- settings
local fakeForever = false -- changes the watermark text between forever engine and psych engine, depending on what you wanna make
local miniTimeTxt = true -- adds a little time bar where the diff text is, which isnt forever accurate but is a neat touch

-- data i stole from forever engine
local foreverLetters = {'S+', 'S', 'A', 'B', 'C', 'D', 'E', 'F'}
local foreverPercents = {100, 95, 90, 85, 80, 75, 70, 65}
local foreverRating = 'N/A'

function onCreate()

  makeLuaSprite('tabihealthbar2', 'hud/nightmarehud', 0, 500)
	setObjectCamera('tabihealthbar2', 'hud')
	scaleObject('tabihealthbar2', 1, 1);
	addLuaSprite('tabihealthbar2', true)
  setProperty('tabihealthbar2.visible', true)
  

  health = getProperty('health')

	if getProperty('health') > 0.2 then
	    setProperty('health', health+ -0.5)
	end
	
end

function onCreatePost()

  setProperty('timeBarBG.visible',false)
  setProperty('timeBar.visible',false)
  setProperty('timeTxt.visible',false)
  setProperty('scoreTxt.visible',false)
  removeLuaSprite('tabihealthbar', true)

  if not getPropertyFromClass('ClientPrefs', 'hideHud') then addLuaText('foreverScore') end

  setProperty('tabihealthbar2.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))

  setProperty('tabihealthbar2.x', getProperty('healthBar.x') - 92)
  setProperty('tabihealthbar2.y', getProperty('healthBar.y') - 69)

  setProperty('tabihealthbar3.x', getProperty('healthBar.x') - 70)
  setProperty('tabihealthbar3.y', getProperty('healthBar.y') - 69)
  
  setObjectOrder('tabihealthbar2', 4)
  setObjectOrder('tabihealthbar3', 4)
  setObjectOrder('healthBar', 3)
  setObjectOrder('healthBarBG', 2)

  
end



function onUpdatePost(elapsed)
  local lifebar = getProperty('healthBar.percent')

  reloadRating(round((getProperty('ratingPercent') * 100), 2))
  setTextString('foreverScore',
  'Score: '..score.. -- setup score
  ' - Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%'.. --setup accuracy
  (((hits > 0) or (songMisses > 0)) and ' [' .. (not botPlay and ratingFC or 'N/A') .. ']' or '').. -- figure out fc
  ' - Health: '..lifebar.. -- misses (easy)
  ' - Rank: '..foreverRating) -- rating (dumb
  if miniTimeTxt and getPropertyFromClass('ClientPrefs', 'timeBarType') ~= 'Disabled' and curStep > 0 then
    setTextString('foreverInfo', songName .. ' - ' .. string.upper(difficultyName) .. ' [' .. milliToHuman(math.floor(getPropertyFromClass('Conductor', 'songPosition') - noteOffset)) .. ' / ' .. milliToHuman(math.floor(songLength)) .. ']')
end
end

function onRecalculateRating()
  local life = getProperty('healthBar.percent')
  reloadRating(round((getProperty('ratingPercent') * 100), 2))
  setTextString('foreverScore',
  'Score: '..score.. -- setup score
  ' - Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%'.. --setup accuracy
  (((hits > 0) or (songMisses > 0)) and ' [' .. (not botPlay and ratingFC or 'N/A') .. ']' or '').. -- figure out fc
  ' - Health: '..life.. -- misses (easy)
  ' - Rank: '..foreverRating) -- rating (dumb)
end


function reloadRating(percent)
  -- figures out your rating
  for i = 1,#foreverLetters do
    if foreverPercents[i] <= percent then
      foreverRating = foreverLetters[i]
      break
    end
  end
end

function milliToHuman(milliseconds) -- https://forums.mudlet.org/viewtopic.php?t=3258
	local totalseconds = math.floor(milliseconds / 1000)
	local seconds = totalseconds % 60
	local minutes = math.floor(totalseconds / 60)
	minutes = minutes % 60
	return string.format("%02d:%02d", minutes, seconds)  
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end
