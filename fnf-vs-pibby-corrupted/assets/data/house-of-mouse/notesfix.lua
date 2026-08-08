function onSongStart()
    setObjectCamera('ffade', 'hud')
    setObjectCamera('flash', 'hud')
    setObjectOrder('ffade', getObjectOrder('iconP2') + 1)
    setObjectOrder('flash', getObjectOrder('iconP2') + 2)
    for i = 0,7 do
        setObjectCamera('strumLineNotes.members['..i..']', 'other')
    end
end

function onSpawnNote(id)
    setObjectCamera('notes.members['..id..']', 'other')
    setProperty('notes.members['..id..'].colorTransform.redOffset',150)
    setProperty('notes.members['..id..'].colorTransform.greenOffset',150)
    setProperty('notes.members['..id..'].colorTransform.blueOffset',150)

end

function onUpdatePost()
    setProperty('camOther.zoom', getProperty('camHUD.zoom'))
end