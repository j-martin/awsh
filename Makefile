SETUP := python setup.py
VERSION_FILE := awsh/version.py
VERSION := $(shell python $(VERSION_FILE))

build: clean
	help2man --name='AWSH' --output='awsh.1' 'python awsh'
	pandoc --from=markdown --to=rst --output=README.rst README.md
	$(SETUP) sdist

uninstall:
	pip uninstall awsh || true

install: uninstall build
	pip install "`find dist -name 'awsh*tar.gz'`"

pipy-install: uninstall
	pip install awsh

release: build
	git commit -m "releasing $(VERSION)" "$(VERSION_FILE)"
	git push
	git tag "$(VERSION)"
	git push --tags
	$(SETUP) sdist upload -r pypi

clean:
	rm -rf build dist
