_DaycareGentlemanAllRightThenText::
	text "All right then,"
	line "@"
	text_end

_DaycareGentlemanComeAgainText::
	text "Come again."  ; marcelnote - capitalized 'come'
	done

_DaycareGentlemanNoRoomForMonText::
	text "You have no room"
	line "for this #MON!"
	done

_DaycareGentlemanOnlyHaveOneMonText::
	text "You only have one"
	line "#MON with you."
	done

_DaycareGentlemanCantAcceptMonWithHMText::
	text "I can't accept a"
	line "#MON that"
	cont "knows an HM move."
	done

_DaycareGentlemanHeresYourMonText::
	text "Thank you! Here's"
	line "your #MON!"
	prompt

_DaycareGentlemanNotEnoughMoneyText::
	text "Hey, you don't"
	line "have enough ¥!"
	done
