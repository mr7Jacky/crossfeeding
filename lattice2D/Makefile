# Compile options:
# 1. Compile the code for Commensalism in release mode
#    g++ *.cpp -O3
# 2. Compile the code for Commensalism in debug mode
#    g++ *.cpp -D DEBUG
# 3. Compile the code for Syntrophy in release mode
#    g++ *.cpp -O3 -D TOXICITY
# 4. Compile the code for Syntrophy in debug mode
#    g++ *.cpp -D DEBUG -D TOXICITY
# 5. Compile the code for Mutualism in release mode
#    g++ *.cpp -O3 -D TOXICITY -D MUTUALISM
# 6. Compile the code for Mutualism in debug mode
#    g++ *.cpp -D DEBUG -D TOXICITY -D MUTUALISM #do we include tox?
# 7. Compile the code for Mutualism with Toxicity in release mode
#    g++ *.cpp -O3 -D MUTUALISM -D TOXICITY
# 8. Compile the code for Mutualism with Toxicity in debug mode
#    g++ *.cpp -D DEBUG -D TOXICITY -D MUTUALISM

G = g++
DEBUG = -D DEBUG #Debug mode
C = *.cpp -O3
TOX = -D TOXICITY
MUTUAL = -D MUTUALISM

commensalism:
	$(G) $(C)
commensalism-d:
	$(G) $(C) $(DEBUG)

syntrophy:
	$(G) $(C) $(TOX)
syntrophy-d:
	$(G) $(C) $(TOX) $(DEBUG)

mutualism:
	$(G) $(C) $(MUTUAL)
mutualism-d:
	$(G) $(C) $(MUTUAL) $(DEBUG)

mutualism-tox:
	$(G) $(C) $(MUTUAL) $(TOX)
mutualism-tox-d:
	$(G) $(C) $(TOX) $(MUTUAL) $(DEBUG)

