import sys  # sys нужен для передачи argv в QApplication
from PyQt6 import QtWidgets
from PyQt6.QtSql import QSqlDatabase, QSqlQuery, QSqlError
from PyQt6.QtCore import QCoreApplication

import design  # Это наш конвертированный файл дизайна
from dotenv import load_dotenv
import os

class ExampleApp(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()
        self.ui = design.Ui_Coworkings()
        self.ui.setupUi(self)  # Это нужно для инициализации нашего дизайна
        self.db_connect()
        
    def db_connect(self):
        load_dotenv()
        self.db = QSqlDatabase.addDatabase('QPSQL')
        self.db.setHostName(os.getenv('DB_HOST'))
        self.db.setDatabaseName(os.getenv('DB_NAME'))
        self.db.setUserName(os.getenv('DB_USER'))
        self.db.setPassword(os.getenv('DB_PASSWORD'))
        self.db.setPort(int(os.getenv('DB_PORT')))
        
        if not self.db.open():
            print("Доступные драйверы:", QSqlDatabase.drivers())
            print('Ошибка подключения к БД:', self.db.lastError().text())
            return False
        return True

    def __del__(self):
        if hasattr(self, 'db') and self.db.isOpen():
            self.db.close()

def main():
    app = QtWidgets.QApplication(sys.argv)  # Новый экземпляр QApplication
    window = ExampleApp()  # Создаём объект класса ExampleApp
    window.show()  # Показываем окно
    app.exec()  # и запускаем приложение

if __name__ == '__main__':  # Если мы запускаем файл напрямую, а не импортируем
    main()  # то запускаем функцию main()