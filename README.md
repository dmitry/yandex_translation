Try it in irb:

    require 'yandex_translation'

    p Yandex::Translation.word('машина', 'es-ru-es')
    p Yandex::Translation.text('кто бы мог подумать об этом, но это так', 'ru-en')
    p Yandex::Translation.text('who knows what does it mean', 'en-ru')
