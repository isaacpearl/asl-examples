function init()
    for c=1, 4 do
        output[c].asl:action()
    end
end

a = { 3, 6, 9 }
b = { 2, 4, 8 }
c = { 1, 5, 7 }

seq1 = { ix = 0, notes = a }
seq2 = { ix = 0, notes = b }
seq3 = { ix = 0, notes = c }

time = 1 

local function nx( seq )
    return function()
        seq.ix = seq.ix+1
        if seq.ix > #seq.notes then seq.ix = 1 end
        return seq.notes[seq.ix]/12.0
    end
end

output[1].asl:action(
    loop{ note( nx(seq1), time/4, 'linear' ),
		  note( nx(seq2), time/4, 'linear' ), 
		  note( nx(seq3), time/4, 'linear' ), 
	})

output[2].asl:action(
    loop{ note( nx(seq2), time, 'linear' ),
		  note( nx(seq3), time, 'linear' ), 
		  note( nx(seq1), time, 'linear' ), 
	})
output[3].asl:action(
	loop{ note(function() return output[2].volts*5 end, time/20, 'linear'),
		  note(function() return input[1]()*-5 end, time/20, 'linear'),
	})
