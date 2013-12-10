# Run this script using Monkeyrunner.

import commands
import time
from com.android.monkeyrunner import MonkeyRunner, MonkeyDevice

_PACKAGES_TO_BE_DISABLED = (
		'com.google.android.apps.magazines',
		'com.google.android.apps.plus',
		'com.google.android.keep',
		'com.google.android.play.games',
		'com.google.android.videos',
		'com.google.earth',
		)
_PACKAGE_INFO_COMMAND = ('adb shell am start -a '
		'android.settings.APPLICATION_DETAILS_SETTINGS '
		'-n com.android.settings/.applications.InstalledAppDetails '
		'-d %s')

_SLEEP_TIME_BETWEEN_INTERACTION = 1  # In seconds.


def isEnabled(package_name):
	# List enabled packages.
	status, output = commands.getstatusoutput('adb shell pm list packages -e')
	if ('package:%s' % package_name) in output:
		return True

def click(device, x, y):
	device.touch(x, y, MonkeyDevice.DOWN_AND_UP)


def disableApp(device, package_name):
	assert package_name
	if not isEnabled(package_name):
		print 'Package %s is already disabled.' % package_name
		return
	else:
		print 'Disabling package %s' % package_name

	# Coordinates of a point on disable button.
	status, output = commands.getstatusoutput(
			_PACKAGE_INFO_COMMAND % package_name)
	assert status == 0
	_POINT1= {'X': 800, 'Y': 500}
	click(device, _POINT1['X'], _POINT1['Y'])
	time.sleep(_SLEEP_TIME_BETWEEN_INTERACTION)
	# Coordinates of a point on the OK button which appears in a modal dialog
	# shown as a result of clicking "Disable".
	_POINT2 = {'X': 700, 'Y': 1100}
	click(device, _POINT2['X'], _POINT2['Y'])
	# Only needed in some cases, when disabling a package requires data to be
	# cleared.
	time.sleep(_SLEEP_TIME_BETWEEN_INTERACTION)
	_POINT3 = {'X': 700, 'Y': 1100}
	click(device, _POINT3['X'], _POINT3['Y'])


def main():
	device = MonkeyRunner.waitForConnection()
	for package in _PACKAGES_TO_BE_DISABLED:
		disableApp(device, package)


if __name__ == '__main__':
	main()


