# R18n Rails API

Rails I18n compatibility for R18n:
* R18n loader for Rails I18n translation format;
* R18n backend.

## How To

### Rails Translations

You can use `R18n::Loader::Rails` to load translations from `I18n.load_path`:

`i18n/en.yml`:

```yaml
en:
  posts:
    one: One post
    many: %{count} posts
```

`example.rb`:

```ruby
require 'r18n-rails-api'

I18n.load_path = ['i18n/en.yml']
i18n = R18n::I18n.new('en', R18n::Loader::Rails)

i18n.posts(count: 5) #=> "5 posts"
```

### Backend

You can use R18n as a backend for Rails I18n:

```ruby
require 'r18n-rails-api'

R18n.set('en', 'path/to/translation')
I18n.backend = R18n::Backend.new

I18n.l Time.now, format: :full #=> "6th of December, 2009 22:44"
I18n.t :greeting, name: 'John' #=> "Hi, John"
I18n.t :users, count: 5        #=> "5 users"
```

## R18n Features

* Nice Ruby-style syntax.
* Filters.
* Flexible locales.
* Custom translations loaders.
* Translation support for any classes.
* Time and number localization.
* Several user languages support.

## License

R18n is licensed under the GNU Lesser General Public License version 3.
You can read it in LICENSE file or in http://www.gnu.org/licenses/lgpl.html.

## Author

Andrey “A.I.” Sitnik <andrey@sitnik.ru>
