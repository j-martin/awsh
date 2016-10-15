from distutils.core import setup

VERSION='1.0.12'

setup(
    name='awsh',
    packages=['awsh'],
    version=VERSION,
    description='SSH into your EC2 instances based on their configurations.',
    author='Jean-Martin Archer',
    author_email='pypi@jmartin.ca',
    url='https://github.com/j-martin/awsh',
    download_url='https://github.com/j-martin/awsh/archive/{}.tar.gz'.format(VERSION),
    keywords=['tool', 'aws', 'ec2'],
    classifiers=[],
    long_description=open('README.rst').read(),
    install_requires=[
        'awscli>=1.10.14',
        'boto3>=1.3.1'
    ],
    entry_points={
        'console_scripts': ['awsh = awsh:main']
    }
)
