build:
	help2man --name='AWSH' --output='awsh.1' 'python awsh'
	python setup.py build

install:
	pip uninstall awsh || true
	python setup.py install

release: build
	git tag $(python awsh/version.py)
	git push --tags
	python setup.py sdist upload -r pypi
