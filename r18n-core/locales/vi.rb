module R18n
  class Locales::Vi < Locale
    set title: 'Vietnamese',
        sublocales: [],

        week_start: :'Ch? nh?t',
        wday_names: %w{'Ch? nh?t' 'Th? hai' 'Th? ba' 'Th? t?' 'Th? n?m' 'Th? 6'
                       'Th? b?y'},
        wday_abbrs: %w{CN T2 T3 T4 T5 T6 T7},

        month_names: %w{'Th�ng m?t' 'Th�ng hai' 'Th�ng hai' 'Th�ng t?' 'Th�ng n?m' 'Th�ng s�u' 'Th�ng b?y' 'Th�ng t�m'
                        'Th�ng ch�n' 'Th�ng m??i' 'Th�ng m??i m?t' 'Th�ng m??i hai'},
        month_abbrs: %w{th1 th2 th3 th4 th5 th6 th7 th8 th9 th10 th11 th12},

        date_format: '%d/%m/%Y',
        full_format: '%e c?a %B',
        year_format: '_, %Y',

        number_decimal: ".",
        number_group:   ","

    def ordinalize(n)
      "#{n}"
    end

    def format_date_full(date, year = true, *params)
      format = full_format
      format = year_format.sub('_', format) if year
      strftime(date, format.sub('%e', ordinalize(date.mday)))
    end
  end
end
