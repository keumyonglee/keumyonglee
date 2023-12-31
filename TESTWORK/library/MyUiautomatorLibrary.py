from uiautomator2 import connect, Device
from robot.libraries.BuiltIn import BuiltIn

class MyUiautomatorLibrary:
    def __init__(self):
        self.device = None

    def connect_device(self, device_name):
        self.device = connect(device_name)

    def open_application(self, package_name, activity_name):
        if self.device:
            self.device.app_start(package_name, activity_name)
            
    def open_notification(self):
        self._log_debug("Open notification bar")
        try:
            d.open_notification()
        except (Exception, BaseException) as e:
            if hasattr(e, 'message'):
                self._log_error(e.message)
                BuiltIn().fail(e.message)
            else:
                self._log_error(e)
                BuiltIn().fail(e)
        
    def disconnect_device(self):
        if self.device:
            self.device.press("home")
            self.device = None

    def shell_adb(self, command):
        self._log_debug("Run shell command [" + command + "]")
        try:
            response = self.device.shell(command)  # Use the 'shell' method
            return response.output  # Get the output content
        except (Exception, BaseException) as e:
            self._log_error(e)
            self._fail_with_message(e)

    # 추가로 Shell Adb 키워드 정의
    def shell_adb_keyword(self, command):
        return self.shell_adb(command)

    def _log_debug(self, message):
        BuiltIn().log(message, "DEBUG")

    def _log_error(self, message):
        BuiltIn().log(message, "ERROR")

    def _fail_with_message(self, message):
        BuiltIn().fail(message)