#!/bin/bash
# Перекодирует рекурсивно в текущем каталоге имена
# файлов и каталогов в транслит.

shopt -s nullglob
for NAME in * ; do
 filename=$(basename "$NAME");
 extension=${filename##*.};
 filename=${filename%.*};

 TRS=`echo $filename | sed "y/абвгдезийклмнопрстуфхцы/abvgdezijklmnoprstufxcy/"`
 TRS=`echo $TRS | sed "y/АБВГДЕЗИЙКЛМНОПРСТУФХЦЫ/ABVGDEZIJKLMNOPRSTUFXCY/"`
 TRS=${TRS//ч/ch};
 TRS=${TRS//./};
 TRS=${TRS// /-};
 TRS=${TRS//Ч/CH} TRS=${TRS//ш/sh};
 TRS=${TRS//Ш/SH} TRS=${TRS//ё/jo};
 TRS=${TRS//Ё/JO} TRS=${TRS//ж/zh};
 TRS=${TRS//Ж/ZH} TRS=${TRS//щ/sh};
 TRS=${TRS///SH\'} TRS=${TRS//э/je};
 TRS=${TRS//Э/JE} TRS=${TRS//ю/ju};
 TRS=${TRS//Ю/JU} TRS=${TRS//я/ja};
 TRS=${TRS//Я/JA} TRS=${TRS//ъ/};
 TRS=${TRS//ъ\`} TRS=${TRS//ь/};
 TRS=${TRS//Ь/}
 TRS=${TRS//,/};
 TRS=${TRS//(/};
 TRS=${TRS//)/};
 TRS=${TRS//\'/};
 TRS=${TRS//\"/};
 TRS=${TRS//---/-};
 TRS=${TRS//--/-};
 if [[ `file -b "$NAME"` == directory ]]; then
 mv -v "$NAME" "$TRS"
 cd "$TRS"
 "$0"
 cd ..
 else
 mv -v "$NAME" "$TRS.$extension"
 fi
done