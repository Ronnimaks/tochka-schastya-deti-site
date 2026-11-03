#!/bin/sh
# ОБНОВИТЬ КОПИЮ САЙТА НА GITHUB
# Что делает: берёт рабочую версию C:\Agency\LEO\прототип\index_v6.html и медиа,
# кладёт сюда и отправляет в https://github.com/Ronnimaks/tochka-schastya-deti-site
# Когда запускать: после каждой выкладки сайта (артефакт, хостинг) - так велит правило о резервной копии.
# Как: sh обновить.sh "что поменялось"
set -e
cd "$(dirname "$0")"
SRC="C:/Agency/LEO/прототип"
cp "$SRC/index_v6.html" index.html
cp "$SRC"/media/gen-*.jpg "$SRC"/media/hero-drugoe-poster.jpg "$SRC"/media/hero-drugoe-vertical.mp4 "$SRC"/media/logo-gold.svg media/
cp "$SRC"/media/review-*.jpg "$SRC"/media/review-*.mp4 media/
git add -A
git commit -m "${1:-Обновление сайта}" || { echo "Изменений нет"; exit 0; }
git push
