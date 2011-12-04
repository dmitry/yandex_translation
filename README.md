Try it in irb:

    require 'yandex_translation'

    p Yandex::Translate.word('машина', 'es-ru-es')
    p Yandex::Translate.text('кто бы мог подумать об этом, но это так', 'ru-en')
    p Yandex::Translate.text('who knows what does it mean', 'en-ru')
