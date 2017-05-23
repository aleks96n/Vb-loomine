require "test_helper"
require "rubygems"
require "selenium-webdriver"
driver = Selenium::WebDriver.for :chrome
driver.navigate.to "http://localhost:3000/"
wait = Selenium::WebDriver::Wait.new(timeout: 3)


#Tests all buttons
for element in driver.find_elements(tag_name: 'a')
  wait.until {element.displayed?}
  element.click
end

#Test create user too long name
#Setup
driver.navigate.to "http://localhost:3000/signup"
name = driver.find_element(id: "name")
email = driver.find_element(id: "validate")
pass = driver.find_element(id: "pass")
repass = driver.find_element(id: "repass")
button = driver.find_element(name: "commit")

name.send_keys = "auto-generated"
email.send_keys = "email@email.com"
pass.send_keys = "password"
repass.send_keys "password"
button.click




#Test log in

driver.navigate.to "http://localhost:3000/login"

login = driver.find_element(id: "validate")
login.send_keys "test@test.ee"

password = driver.find_element(id: "pass")
password.send_keys "testee123"

button = driver.find_element(name: "commit")
button.click



driver.quit
