<%@ Language=VBScript %>
<%

Dim wordOne, wordTwo, number
Dim lowerBound, upperBound
Dim pwd

wordOne = Array ("Tin","Mad","Fly","Page","Test","Ball","Base","Blue","Sky","Jump",_
				"Star","Bat","Bird","Joke","Link","Logo","Info","Poll","Fone","Sun",_
				"Wire","Cool","Poke","Will", "Mole")

wordTwo = Array ("Bull","Cat","Drop","Wall","Site","Haha","Head","Only","Four","Dogs",_
					"Join","Boat","Coat","Ship","Soak","Wash","Spin","Coin","Tune","Kill","Pray","Blue",_
					"Rain","Snow","Haze","Five","Nine","Jinx")

pwd = wordOne(generateRandomNo(0,24)) & wordTwo(generateRandomNo(0,24)) & CStr(generateRandomNo(10,99))
Session("UserEntryData").Item("Password")= pwd
Session("MemberData").Item("Password")= pwd
'Response.Redirect "adduser.asp"
Response.Redirect "saveuser.asp"

Function generateRandomNo(ByVal lowerBound, ByVal upperBound)
	Randomize
	generateRandomNo= Int((upperBound - lowerBound + 1) * Rnd + lowerBound)
End Function
%>

