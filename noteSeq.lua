function init()
    for c=1, 4 do
        output[c].asl:action()
    end
end

seq = {1, 3, 5, 6, 7, 8, (1+12), (3+12), (5+12), (6+12), (7+12), (8+12)}
seqIndex = 1

function stepThru()
	lastIndex = seqIndex
	seqIndex = 1 + (seqIndex % #seq)
	return seq[lastIndex]
end

function jumpThru()
	index = math.ceil(math.random(#seq))
	return seq[index] 
end

function n2v(n)
	if type(n) == 'function' then
		return function () return n()/12 end
	else
		return n/12
	end
end

function note(noteNum, duration)
		return{toward(n2v(noteNum), 0), toward('here', duration)}
end

output[1].action =
	loop{note(stepThru, 0.25),
		 note(jumpThru, 0.5),
	}

output[1].asl:action()
