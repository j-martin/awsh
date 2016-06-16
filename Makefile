SETUP := python setup.py
VERSION := $(shell $(SETUP) --version)

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

sdist: clean
	$(SETUP) sdist

release: build
	git tag "$(VERSION)"
	git push --tags
	$(SETUP) sdist upload -r pypi

clean:
	rm -rf build dist
