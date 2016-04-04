if v == nil then v = {} end

function init(me)
	node_setCursorActivation(me, true)
	
	v.text = createBitmapText(COSTUMES["anims"][ANIM], 1500, 4934, 5296)
end

function update(me, dt)
	if(not STOPPED) then
		entity_setState(getNaija(), 1234)
		if(entity_getAnimationName(getNaija()) ~= COSTUMES["anims"][ANIM]) then
			entity_animate(getNaija(), COSTUMES["anims"][ANIM], -1)
		end
		text_setText(v.text, COSTUMES["anims"][ANIM])
	else
		text_setText(v.text, "")
	end
end

function activate(me, dt)
	ANIM = ANIM + 1
	if(ANIM > #COSTUMES["anims"]) then
		ANIM = 1
	end
end