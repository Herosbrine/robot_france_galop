#!/usr/bin/python3
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.common.exceptions import NoSuchElementException
from time import sleep

def get_distance_mere(word1, word2):
    option = webdriver.ChromeOptions()
    option.add_argument("window-size=1280,800")
    option.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36")
    #option.add_argument('proxy-server=106.122.8.54:3128')
    try:
        link_to = "https://www.france-galop.com/fr"
        driver = webdriver.Chrome(executable_path='/usr/local/bin/chromedriver', options=option)

        driver.set_page_load_timeout(10)
        driver.get(link_to)
        driver.maximize_window()
        searchbar = driver.find_element_by_id("edit-keys")
        #driver.find_element_by_xpath("//button[@onclick=\"cmp_pv.cookie.saveConsent(true);\"]").click()
        searchbar.send_keys(word1)
        sleep(1)
        searchbar.send_keys(word2)
        sleep(1)
        #get_link to horse
        elems = driver.find_elements_by_css_selector(".search--results [href]")
        links = [elem.get_attribute('href') for elem in elems]
        links_to_mere = links[0]
        driver.get(links_to_mere)
        sleep(1)
        #get_link to mere horse
        elems = driver.find_elements_by_css_selector(".col-sm-4 [href]")
        links = [elem.get_attribute('href') for elem in elems]
        mere_links = links[1]
        driver.get(mere_links)
        sleep(4000)
    except:
        exit(84)
        #elem1 = driver.find_elements_by_xpath('//*[@class="odd"]')
        #elem2 = driver.find_elements_by_xpath('//*[@class="even"]')
        #toto = driver.find_element_by_class_name("btn more")
        #for element in toto:
        #    try:
        #        element.click()
        #        sleep(1)
        #    except:
        #        chaha = 1
        #for element in elem1:
        #    print(element.text)
        #for element in elem2:
        #    print(element.text)

def parse_argv(argv):
    index = len(argv)
    word1 = ""
    word2 = argv[-1]

    for i, element in enumerate(argv):
        if (i + 1 != index):
            word1 += element
    return (word1, word2)

def main():
    result = input("Nom du cheval : ")
    word1, word2 = parse_argv(result)
    get_distance_mere(word1, word2)
main()