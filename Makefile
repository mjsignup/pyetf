pretty:
	isort etfpy/ && isort tests/
	black etfpy/ && black tests/

test:
	pytest tests/ -vv -ss -k "not test_functional"
cov:
	coverage run --source=etfpy -m pytest tests/ -vv -ss -k "not test_functional" && coverage report -m
test-functional:
	pytest tests/test_functional.py -ss -vv
scrape:
	python etfpy/scripts/scrape_etfs.py
scrape-refresh:
	python etfpy/scripts/scrape_etfs.py -fp=etfpy/data/etfs/etfs_list.json

