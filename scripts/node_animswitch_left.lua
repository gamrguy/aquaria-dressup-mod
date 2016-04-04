function init(me)
	node_setCursorActivation(me, true)
end

function update(me, dt)
end

function activate(me, dt)
	ANIM = ANIM - 1
	if(ANIM < 1) then
		ANIM = #COSTUMES["anims"]
	end
end