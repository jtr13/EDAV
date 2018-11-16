import scrapy
import re

class InternalLinkSpider(scrapy.Spider):
    name = "links"

    def start_requests(self):
        #for new pages, insert here to crawl
        urls = [
            'https://edav.info/',
            'https://edav.info/index.html',
            'https://edav.info/basics.html',
            'https://edav.info/project.html',
            'https://edav.info/contribute.html',
            'https://edav.info/iris.html',
            'https://edav.info/bar.html',
            'https://edav.info/box.html',
            'https://edav.info/scatter.html',
            'https://edav.info/heatmap.html',
            'https://edav.info/histo.html',
            'https://edav.info/ridgeline.html',
            'https://edav.info/dates.html',
            'https://edav.info/maps.html',
            'https://edav.info/missing.html',
            'https://edav.info/network.html',
            'https://edav.info/general.html',
            'https://edav.info/percept.html',
            'https://edav.info/publish.html',
            'https://edav.info/github.html',
            'https://edav.info/chapter-index.html',
            'https://edav.info//',
            'https://edav.info/./',
            'https://edav.info/intro.html',

        ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        page = response.url.split("https://edav.info")[1]

        for link in response.xpath('//a[(@target = "_blank") and @href]/@href').extract():
            #check for patterns that are common for external link
            if "http" not in link:
                #if unusual, report
                yield{
                    'Open New Tab': True,
                    'URL_Source': page,
                    'Link': link
                }

        for link in response.xpath('//a[not(@target) and @href]/@href').extract():
            
            #check patterns that are common for internal links
            if (".html" not in link) and ("#top" not in link) and ("./" not in link) and ("mailto:" not in link):
                #if unusual, report
                yield{
                    'Open New Tab': False,
                    'URL_Source': page,
                    'Link': link
                }