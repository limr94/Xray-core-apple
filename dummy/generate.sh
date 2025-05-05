#!/bin/bash

# Файл для обработки
TARGET_FILE=${1:-dummy2.go}

# Проверяем, существует ли файл
if [[ ! -f "$TARGET_FILE" ]]; then
    echo "❌ Файл $TARGET_FILE не найден!"
    exit 1
fi

echo "📜 Добавляем 1000 заглушечных функций в $TARGET_FILE..."

# Добавляем функции в конец файла
for i in $(seq 1 100000); do
    cat <<EOT >> "$TARGET_FILE"

var DummyDataN$i = make([]byte, 100) // 100MB данных
var DummyMapN$i = map[int]string{
    1:  "value1",
    2:  "value2",
    3:  "value3",
    4:  "value4",
    5:  "value5",
    6:  "value6",
    7:  "value7",
    8:  "value8",
}
type DummyStructNNew$i struct {
    Data [4096]byte // 4KB данных
}

EOT
done

echo "✅ 1000 функций успешно добавлены в $TARGET_FILE!"
