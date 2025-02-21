#!/bin/bash

# Проверка наличия необходимых утилит
for cmd in pwgen notify-send; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "$cmd не установлен. Пожалуйста, установите его и повторите попытку."
        exit 1
    fi
done

# Установка значений по умолчанию
LENGTH=16
CHARSET="\"~!@:',.+();{}=-_<>\`"

# Обработка аргументов командной строки
while getopts "l:c:" opt; do
    case $opt in
        l) 
            # Проверка, что длина пароля является положительным целым числом
            if [[ "$OPTARG" =~ ^[1-9][0-9]*$ ]]; then
                LENGTH=$OPTARG
            else
                notify-send "Ошибка" "Длина пароля должна быть положительным целым числом больше 0."
                exit 1
            fi
            ;;
        c) 
            # Проверка, что набор символов не пустой
            if [[ -z "$OPTARG" ]]; then
                notify-send "Ошибка" "Набор символов не может быть пустым."
                exit 1
            fi
            CHARSET=$OPTARG 
            ;;
        *) 
            notify-send "Ошибка" "Использование: $0 [-l длина] [-c набор_символов]"
            exit 1 
            ;;
    esac
done

# Генерация пароля
if PASSWORD=$(pwgen -syvB -1 "$LENGTH" -r "$CHARSET" 2>/dev/null); then
    # Проверка наличия утилит для копирования в буфер обмена
    if command -v wl-copy &> /dev/null; then
        echo "$PASSWORD" | wl-copy
        CLIP_TOOL="wl-copy"
    elif command -v xclip &> /dev/null; then
        echo "$PASSWORD" | xclip -selection clipboard
        CLIP_TOOL="xclip"
    else
        notify-send "Ошибка" "Ни wl-copy, ни xclip не установлены. Установите одну из этих утилит для копирования в буфер обмена."
        exit 1
    fi

    # Отправка уведомления об успешной генерации пароля
    notify-send -t 2400 --hint int:transient:1 "pwgen" "Пароль длиной $LENGTH скопирован в буфер обмена с помощью $CLIP_TOOL" -i '/usr/share/icons/Adwaita/32x32/actions/edit-copy-symbolic.symbolic.png'
else
    notify-send "Ошибка" "Не удалось сгенерировать пароль. Проверьте набор символов."
    exit 1
fi
