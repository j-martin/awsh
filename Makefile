SETUP := "python setup.py"

build: clean
	help2man --name='AWSH' --output='awsh.1' 'python awsh'
	$(SETUP) sdist

uninstall:
	pip uninstall awsh || true

install: uninstall build
	pip install "`find dist -name 'awsh*tar.gz'`"

pipy-install: uninstall
	pip install awsh

release: build
	git tag "`python awsh/version.py`"
	git push --tags
	$(SETUP) sdist upload -r pypi

clean:
	rm -rf build dist
