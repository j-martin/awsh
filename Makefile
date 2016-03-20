build: clean
	help2man --name='AWSH' --output='awsh.1' 'python awsh'
	python setup.py sdist

install: build
	pip uninstall awsh || true
	pip install "`find dist -name 'awsh*tar.gz'`"

release: build
	git tag "`python awsh/version.py`"
	git push --tags
	python setup.py sdist upload -r pypi

clean:
	rm -rf build dist
