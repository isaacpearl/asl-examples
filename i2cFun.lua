function init()
	input[1].mode('change') --default event for change is send over serial

    for c=1, 4 do
        output[c].asl:action()
    end
end

input[1].change = function(v)
	if v == 1 then
		output[1].asl:action('restart')
	else
		output[1].asl:action(false)
	end
end

II.pullup(1)

output[1].action = 
{ function() output[2].asl:action('restart') end
	, held{ loop{ to(5, .05, 'sine')
				 ,to(3, .05)
				 ,function() II.jf.trigger(6,1) end
		  }}
	, function() II.jf.trigger( 2, 1 ) end
	, to(0, .3, 'linear')
	}

output[2].action = 
{ to(10, 0.0)
 ,to(0, 0.2)
}

init()
