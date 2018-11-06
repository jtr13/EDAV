A Python scraper, using Scrapy, to check "subtle" link issues in https://edav.info. 

To run, navigate to the top directory with your terminal, then execute: 

`scrapy crawl links -o wrong_links.json`.

This will execute the crawl, activating the 'spider'. The 'spider' will traverse through the links provided in `linkchecker/spiders/links.py` under the `url` variable and will find all abnormal links. It will output a JSON file, containing links that are supposed to open/not open a new tab. You can then use this JSON file to fix the source code in https://github.com/jtr13/EDAV.

More information can be found on: https://scrapy.org/.