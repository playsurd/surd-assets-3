function onCreatePost()
makeLuaText('translation', '    word "rap"', 1000,0, (downscroll and 200 or 500))
screenCenter('translation', 'x')
setTextSize('translation',33)
setObjectCamera('translation','hud')
setProperty('translation.visible',false)
addLuaText('translation',true)

makeLuaText('translationColo', 'THE           ', 1000,0, (downscroll and 200 or 500))
screenCenter('translationColo', 'x')
setTextSize('translationColo',33)
setObjectCamera('translationColo','hud')
setTextColor('translationColo', 'fff907')
setProperty('translationColo.visible',false)
addLuaText('translationColo',true)
end



function onStepHit()
    if curStep == 1156 then
        setProperty('translation.visible',true)
        setProperty('translationColo.visible',true)
    elseif curStep == 1158 then
        setTextString('translation', 'the      "rap"')
        setTextString('translationColo', '    WORD      ')
    elseif curStep == 1161 then
        setTextString('translation', 'the word      ')
        setTextString('translationColo', '         "RAP"')

    elseif curStep == 1165 then
        setTextString('translation', '    the word "death"')
        setTextString('translationColo', 'AND                 ')
    elseif curStep == 1168 then
        setTextString('translation', 'and     word "death"')
        setTextString('translationColo', '    THE             ')
    elseif curStep == 1171 then
        setTextString('translation', 'and the      "death"')
        setTextString('translationColo', '       WORD       ')
    elseif curStep == 1176 then
        setTextString('translation', 'and the word        ')
        setTextString('translationColo', '             "DEATH"')
    elseif curStep == 1181 then
        setTextString('translation', '     the same to you')
        setTextString('translationColo', 'MEAN                ')
    elseif curStep == 1190 then
        setTextString('translation', 'Mean     same to you')
        setTextString('translationColo', '     THE            ')
    elseif curStep == 1192 then
        setTextString('translation', 'Mean the      to you')
        setTextString('translationColo','         SAME       ')
    elseif curStep == 1200 then
        setTextString('translation', 'Mean the same    you')
        setTextString('translationColo','              TO    ')
    elseif curStep == 1203 then
        setTextString('translation', 'Mean the same to    ')
        setTextString('translationColo','                 YOU')
    elseif curStep == 1216 then
        removeLuaText('translation',true)
        removeLuaText('translationColo',true)

    end
end
