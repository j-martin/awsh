from distutils.core import setup
from awsh.version import VERSION

install_requirements = [
    'boto3>=1.2.3',
    "botocore>=1.3.15"
]

setup(
    name='awsh',
    packages=['awsh'],
    version=VERSION,
    description='Another AWS SSH client',
    author='Jean-Martin Archer',
    author_email='pypi@jmartin.ca',
    url='https://github.com/j-martin/mypackageawsh',
    download_url='https://github.com/j-martin/awsh/tarball/{}'.format(VERSION),
    keywords=['tool', 'aws', 'ec2'],
    classifiers=[],
    install_requires=install_requirements,
    entry_points={
        'console_scripts': [
            'awsh = awsh:main',
        ]
    }
)
