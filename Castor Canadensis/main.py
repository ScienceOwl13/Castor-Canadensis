import pyautogui
import time
import os

gui = pyautogui


# Click on Apple Icon
gui.moveTo(1,1)
gui.click()
gui.moveTo(50,75)
time.sleep(0.01)
gui.click()

time.sleep(1)

pyautogui.keyDown('ctrlleft')
pyautogui.keyDown('altleft')
pyautogui.press('return')
pyautogui.keyUp('altleft')
pyautogui.keyUp('ctrlleft')


gui.moveTo(50,620)
gui.click()

time.sleep(1)

gui.moveTo(650, 925)
time.sleep(0.1)
gui.click()

gui.moveTo(650,960)
gui.click()

time.sleep(1)

pyautogui.keyDown('command')
pyautogui.press('h')
pyautogui.keyUp('command')