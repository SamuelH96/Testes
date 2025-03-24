from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
from appium.webdriver.common.touch_action import TouchAction
from selenium.webdriver.common.by import By

@keyword("My Drag And Drop")
def drag_drop(origem,destino):
    appium_lib = BuiltIn().get_library_instance('AppiumLibrary')

    driver = appium_lib._current_application()

    ele_origem = driver.find_element(By.XPATH, origem)
    ele_destino = driver.find_element(By.XPATH, destino)

    actions = TouchAction(driver)
    actions.long_press(ele_origem).move_to(ele_destino)
    actions.release()
    actions.perform()