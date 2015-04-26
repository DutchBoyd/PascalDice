# The Gombaud-Pascal Dice Problem
# by Dutch Boyd (February 28, 2014)
# dutch@dutchboyd.com || github.com/dutchboyd
# --------------------------------
# A simulation of the classic probability problem presented to Blaise Pascal
# by Antoine Gombaud in 1654. Attempts to simulate the game of a gambler rolling
# two fair dice N times. If the gambler rolls a double 6, he wins. Otherwise he
# loses. 
#
# Mathematically expressed, the chances of the gambler winning the game is
#
#         P = 1 - (35/36)^N
#
# To be a plus EV game, the gambler has to roll 25 times (50.055%).
# 

def roll (sides = 6)
	rand(1..sides)
end


plays = 100
rollsToFade = 19
playerOne = 0
playerTwo = 0


(1..plays).each do
	
	rollNumber = 0
	dice1 = 0
	dice2 = 0


	while (rollNumber <= rollsToFade) && (dice1 + dice2 != 12)
		dice1 = roll()
		dice2 = roll()
		rollNumber += 1
	end 

	rollNumber <= rollsToFade ? playerOne += 1 : playerTwo += 1

end

print "Rolls to Fade : #{rollsToFade} \n"
print "Gambler's EV = ",  1 - (35/36.to_f)**rollsToFade, "\n"
print "The Gambler Total : #{playerOne} (", (playerOne.to_f / plays.to_f), ")\n"
print "The House Total : #{playerTwo} (", (playerTwo.to_f / plays.to_f), ")\n"

