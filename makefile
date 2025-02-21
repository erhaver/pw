# Makefile для установки скрипта pw.sh

# Переменные
SCRIPT_NAME = pw.sh
INSTALL_PATH = /usr/local/bin/pw

# Цель по умолчанию
all: install

# Установка скрипта
install:
	@echo "Установка скрипта в $(INSTALL_PATH)..."
	@install -Dm755 $(SCRIPT_NAME) $(INSTALL_PATH)
	@echo "Скрипт установлен в $(INSTALL_PATH)."

# Удаление скрипта
uninstall:
	@echo "Удаление скрипта из $(INSTALL_PATH)..."
	@rm -f $(INSTALL_PATH)
	@echo "Скрипт удален."

# Очистка (необязательно)
clean:
	@echo "Нет файлов для очистки."

.PHONY: all install uninstall clean
