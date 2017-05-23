require "test_helper"
require "rubygems"
require "selenium-webdriver"


driver = Selenium::WebDriver.for :chrome

def navigate(driver,link_to)
  driver.navigate.to link_to
  wait_preloader(driver)
end

def wait_preloader(driver)
  preloader = driver.find_element(id: 'page-preloader')
  while preloader.displayed?
  end
end


navigate(driver, "http://localhost:3000/")


#Tests all buttons
for element in driver.find_elements(tag_name: 'a')

  element.click
end

#Test create user too long name
#Setup
navigate(driver, "http://localhost:3000/signup")
name = driver.find_element(id: "name")
email = driver.find_element(id: "validate")
pass = driver.find_element(id: "pass")
repass = driver.find_element(id: "repass")
button = driver.find_element(name: "commit")

name.send_keys("auto-generated")
email.send_keys("email@email.com")
pass.send_keys("password")
repass.send_keys("password")
button.click




#Test log in

navigate(driver, "http://localhost:3000/login")

login = driver.find_element(id: "validate")
login.send_keys "test@test.ee"

password = driver.find_element(id: "pass")
password.send_keys "testee123"

button = driver.find_element(name: "commit")
button.click



driver.quit
