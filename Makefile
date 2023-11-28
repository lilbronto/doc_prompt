# ----------------------------------
#          INSTALLATION
# ----------------------------------
install_requirements:
	@pip install -r requirements.txt

clean:
	@rm -f */version.txt
	@rm -f .coverage
	@rm -fr */__pycache__ */*.pyc __pycache__
	@rm -fr build dist
	@rm -fr doc_prompt-*.dist-info
	@rm -fr doc_prompt.egg-info

install:
	@pip install . -U

all: clean install_requirements install

# ----------------------------------
#      UPLOAD PACKAGE TO PYPI
# ----------------------------------
PYPI_USERNAME=<AUTHOR>
build:
	@python setup.py sdist bdist_wheel

pypi_test:
	@twine upload -r testpypi dist/* -u $(PYPI_USERNAME)

pypi:
	@twine upload dist/* -u $(PYPI_USERNAME)
