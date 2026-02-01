###########################################################################
# (space + # = #) (%S = $) (%% = %) (%^ = ^) (%s = 1 single space)        #
# The + sign = only try passwords with the following token in it.         #
# The ^ sign = try following token only in the begin of password          #
# %d = 1 digit(0-9) %2d = 2 digits(00-99) %1,3d = 1,2 or 3 digits (0-999) #
# ^r1^ ^r2^ ^r3^ = Relative position of token                             #
# The $ sign at the end of a token = token is at the end of password      #
# A space between tokens = OR                                             #
# (%a = a-z) (%A = A-Z) (%1,3in = 1,2 or 3 digits or a-Z)                 #
# (%y = symbol !@#$) (%P = Anything)                                      #
###########################################################################
+ ^pref1 ^pref2 ^pref3
+ word1 word2 word3
second1 second2 second3
+ enda%1,3y$ endb%1,3y$ endc%1,3y$