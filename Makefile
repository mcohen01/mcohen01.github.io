deploy:
	ablog clean
	ablog build

	cp -R _static static
	cp -R _images images

	cp _website/index.html index.html
	sed 's/_static/static/g' index.html > __tmp.html
	mv __tmp.html index.html

	mkdir -p 2019-11-05-whos-using-amazon-forecast
	cp _website/2019-11-05-whos-using-amazon-forecast/index.html 2019-11-05-whos-using-amazon-forecast
	sed 's/\/_static/\/static/g' 2019-11-05-whos-using-amazon-forecast/index.html > __tmp.html
	sed 's/\/_images/\/images/g' __tmp.html > ___tmp.html
	rm __tmp.html
	mv ___tmp.html 2019-11-05-whos-using-amazon-forecast/index.html

	mkdir -p 2020-04-22-what-we-did-during-the-thing
	cp _website/2020-04-22-what-we-did-during-the-thing/index.html 2020-04-22-what-we-did-during-the-thing
	sed 's/\/_static/\/static/g' 2020-04-22-what-we-did-during-the-thing/index.html > __tmp.html
	sed 's/\/_images/\/images\/quarantine/g' __tmp.html > ___tmp.html
	rm __tmp.html
	mv ___tmp.html 2020-04-22-what-we-did-during-the-thing/index.html

	git add --all
	git commit -m "deploy"
	git push origin master

dev:
	pyenv local 3.6.9
	rm -rf venv
	virtualenv venv
	pip install -r requirements.txt
