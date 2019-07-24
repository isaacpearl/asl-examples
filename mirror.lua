function init()
    for c=1, 4 do
        output[c].asl:action()
    end
end

--a function that creates the negated version of an inputted asl slope, for easily declaring symmetrical curves
function mirror(dest, time, shape)
	return {
		to(dest, time, shape),
		to(negate(dest), time, shape)
	}
end

output[1].action = 
	loop{
		mirror(1, 1, 'linear'),
		mirror(.5, .5, 'sine'),
	}
	
output[1].asl:action()
