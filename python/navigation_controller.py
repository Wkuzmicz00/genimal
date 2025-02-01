from PySide6.QtCore import QObject, Signal, Slot

class NavigationController(QObject):
    def __init__(self, stack_view):
        super().__init__()
        self.stack_view = stack_view

    @Slot(str)
    def navigate_to(self, page_url):
        self.stack_view.setSource(page_url)
    
    def go_back(self):
        if self.stack_view.depth() > 1:
            self.stack_view.pop()