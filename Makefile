
all: git-commit gethttp webcrawler

gethttp: gethttp.cpp openhttp.cpp SimpleHTMLParser.cpp
	g++ -o gethttp -g gethttp.cpp openhttp.cpp SimpleHTMLParser.cpp -lcurl

webcrawler:
	g++ -o webcrawler -g webcrawler.cpp openhttp.cpp SimpleHTMLParser.cpp -lcurl

git-commit:
	git add *.cpp *.h Makefile >> .local.git.out  || echo
	git commit -a -m 'Commit' >> .local.git.out || echo
	git push

clean:
	rm -f *.o gethttp webcrawler core
