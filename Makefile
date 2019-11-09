deploy:
	cp _website/index.html index.html
	sed 's/_static/static/g' index.html > __tmp.html
	mv __tmp.html index.html

	mkdir 2019-11-05-whos-using-amazon-forecast
	cp _website/2019-11-05-whos-using-amazon-forecast/index.html 2019-11-05-whos-using-amazon-forecast
	cp -R _static static
	cp -R _images images

	sed 's/\/_static/\/static/g' 2019-11-05-whos-using-amazon-forecast/index.html > __tmp.html
	mv __tmp.html 2019-11-05-whos-using-amazon-forecast/index.html

	git add --all
	git commit -m "deploy"
	git push origin master