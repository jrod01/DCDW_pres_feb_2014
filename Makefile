title  = "DCDW: Pyparsing"
author = "Travis Hoppe"
target = "DCDW_pyparsing.markdown"

# May need to run twice on first pull to copy styles
args = --html_title $(title) --html_author $(author)
all:
	python easy_pres.py $(target) --output index.html $(args)

edit:
	emacs $(target) &

commit:
	@-make push

push:
	git status
	git add index.html
	git add css
	git add js
	git add *.markdown
	git commit -a
	git push

pull:
	git pull
view:
	chromium-browser index.html
clean:
	rm -rvf css js index.html