module ImmosquareConstants
  module Locale
    LOCALES = {
      # Afrikaans
      :af      => "Afrikaans",
      # Amharic
      :am      => "አማርኛ",
      # Arabic
      :ar      => "العربية",
      # Azerbaijani
      :az      => "Azərbaycan",
      # Belarusian
      :be      => "Беларуская",
      # Bulgarian
      :bg      => "Български",
      # Bengali
      :bn      => "বাংলা",
      # Bosnian
      :bs      => "Bosanski",
      # Catalan
      :ca      => "Català",
      # Czech
      :cs      => "Čeština",
      # Welsh
      :cy      => "Cymraeg",
      # Danish
      :da      => "Dansk",
      # German
      :de      => "Deutsch",
      :"de-AT" => "Deutsch (Österreich)",
      :"de-CH" => "Deutsch (Schweiz)",
      :"de-DE" => "Deutsch (Deutschland)",
      # Greek
      :el      => "Ελληνικά",
      # English
      :en      => "English",
      :"en-AU" => "English (Australia)",
      :"en-CA" => "English (Canada)",
      :"en-GB" => "English (United Kingdom)",
      :"en-IE" => "English (Ireland)",
      :"en-IN" => "English (India)",
      :"en-NZ" => "English (New Zealand)",
      :"en-US" => "English (United States)",
      :"en-ZA" => "English (South Africa)",
      # Spanish
      :es      => "Español",
      :"es-AR" => "Español (Argentina)",
      :"es-BO" => "Español (Bolivia)",
      :"es-CL" => "Español (Chile)",
      :"es-CO" => "Español (Colombia)",
      :"es-CR" => "Español (Costa Rica)",
      :"es-DO" => "Español (República Dominicana)",
      :"es-EC" => "Español (Ecuador)",
      :"es-GT" => "Español (Guatemala)",
      :"es-HN" => "Español (Honduras)",
      :"es-MX" => "Español (México)",
      :"es-NI" => "Español (Nicaragua)",
      :"es-PA" => "Español (Panamá)",
      :"es-PE" => "Español (Perú)",
      :"es-PR" => "Español (Puerto Rico)",
      :"es-PY" => "Español (Paraguay)",
      :"es-SV" => "Español (El Salvador)",
      :"es-US" => "Español (Estados Unidos)",
      :"es-UY" => "Español (Uruguay)",
      :"es-VE" => "Español (Venezuela)",
      # Estonian
      :et      => "Eesti",
      # Persian
      :fa      => "فارسی",
      # Finnish
      :fi      => "Suomi",
      # French
      :fr      => "Français",
      :"fr-BE" => "Français (Belgique)",
      :"fr-CA" => "Français (Canada)",
      :"fr-CH" => "Français (Suisse)",
      :"fr-LU" => "Français (Luxembourg)",
      # Gujarati
      :gu      => "ગુજરાતી",
      # Hebrew
      :he      => "עברית",
      # Hindi
      :hi      => "हिन्दी",
      # Croatian
      :hr      => "Hrvatski",
      # Hungarian
      :hu      => "Magyar",
      # Armenian
      :hy      => "Հայերեն",
      # Indonesian
      :id      => "Bahasa Indonesia",
      # Icelandic
      :is      => "Íslenska",
      # Italian
      :it      => "Italiano",
      :"it-CH" => "Italiano (Svizzera)",
      # Japanese
      :ja      => "日本語",
      # Georgian
      :ka      => "ქართული",
      # Kazakh
      :kk      => "Қазақ",
      # Khmer
      :km      => "ភាសាខ្មែរ",
      # Kannada
      :kn      => "ಕನ್ನಡ",
      # Korean
      :ko      => "한국어",
      # Kyrgyz
      :ky      => "Кыргызча",
      # Lao
      :lo      => "ລາວ",
      # Lithuanian
      :lt      => "Lietuvių",
      # Latvian
      :lv      => "Latviešu",
      # Macedonian
      :mk      => "Македонски",
      # Malayalam
      :ml      => "മലയാളം",
      # Mongolian
      :mn      => "Монгол",
      # Marathi
      :mr      => "मराठी",
      # Malay
      :ms      => "Bahasa Melayu",
      # Maltese
      :mt      => "Malti",
      # Burmese
      :my      => "မြန်မာ",
      # Nepali
      :ne      => "नेपाली",
      # Dutch
      :nl      => "Nederlands",
      # Norwegian
      :no      => "Norsk",
      # Odia
      :or      => "ଓଡ଼ିଆ",
      # Punjabi
      :pa      => "ਪੰਜਾਬੀ",
      # Polish
      :pl      => "Polski",
      # Pashto
      :ps      => "پښتو",
      # Portuguese
      :pt      => "Português",
      :"pt-BR" => "Português (Brasil)",
      # Romanian
      :ro      => "Română",
      # Russian
      :ru      => "Русский",
      # Sindhi
      :sd      => "سنڌي",
      # Sinhala
      :si      => "සිංහල",
      # Slovak
      :sk      => "Slovenčina",
      # Slovenian
      :sl      => "Slovenščina",
      # Somali
      :so      => "Soomaali",
      # Albanian
      :sq      => "Shqip",
      # Serbian
      :sr      => "Српски",
      # Sundanese
      :su      => "Basa Sunda",
      # Swedish
      :sv      => "Svenska",
      # Swahili
      :sw      => "Kiswahili",
      # Tamil
      :ta      => "தமிழ்",
      # Telugu
      :te      => "తెలుగు",
      # Tajik
      :tg      => "Тоҷикӣ",
      # Thai
      :th      => "ไทย",
      # Tagalog
      :tl      => "Filipino",
      # Turkish
      :tr      => "Türkçe",
      # Ukrainian
      :uk      => "Українська",
      # Urdu
      :ur      => "اردو",
      # Uzbek
      :uz      => "O'zbek",
      # Vietnamese
      :vi      => "Tiếng Việt",
      # Xhosa
      :xh      => "isiXhosa",
      # Chinese
      :zh      => "中文",
      :"zh-CN" => "中文 (简体)",
      :"zh-TW" => "中文 (繁體)",
      # Zulu
      :zu      => "isiZulu"
    }.freeze

    class << self

      def native_name_for_locale(locale)
        LOCALES[locale.to_sym]
      end

    end
  end
end
