function init(me)
end

function update(me, dt)
	node_setCursorActivation(me, true)
end

function activate(me)
	LEGS = LEGS - 1
	if(LEGS < 1) then
		LEGS = #COSTUMES
	end
	if(COSTUMES[LEGS] == "mithalas_girl2" or COSTUMES[LEGS] == "mithalas_girl1") then
		LEGS = LEGS - 1
	end
	if(LEGS < 1) then
		LEGS = #COSTUMES
	end
	if(COSTUMES[LEGS] == "mithalas_girl1" or COSTUMES[LEGS] == "mithalas_girl2") then
		LEGS = LEGS - 1
	end
	if(LEGS < 1) then
		LEGS = #COSTUMES
	end
	
	setCostume(COSTUMES[LEGS].."-legs")
end