#!/bin/bash

# Директория с `.go`-файлами (по умолчанию текущая)
TARGET_DIR=${1:-$(pwd)}

echo "📂 Сканируем файлы в: $TARGET_DIR"

# Проходим по всем `.go`-файлам
find "$TARGET_DIR" -type f -name "*.go" | while read -r file; do
    echo "🔄 Обрабатываем файл: $file"

    # Определяем `package`
    package_name=$(awk '/^package / {print $2; exit}' "$file")

    # Добавляем заглушки В КОНЕЦ, но внутри `package`
    cat <<EOT >> "$file"

// Dummy functions to increase binary size
package $package_name

func UnusedFunction1() int { return 42 }
func UnusedFunction2() string { return "dummy" }
func UnusedFunction3() bool { return true }
func UnusedFunction4(x int) float64 { return float64(x) * 1.5 }
func UnusedFunction5() []byte { return []byte{0xDE, 0xAD, 0xBE, 0xEF} }

EOT

    echo "✅ Заглушки добавлены в конец: $file"
done

