require '../r18n-core/lib/r18n-core/version'

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'sinatra-r18n'
  s.version = R18n::VERSION.dup
  s.date = Time.now.strftime('%Y-%m-%d')
  s.summary = 'A Sinatra extension that provides i18n support to translate your
    web application.'
  s.description = <<-EOF
    A Sinatra extension that provides i18n support to translate your web
    application. It is just a wrapper for R18n core library.
    It has nice Ruby-style syntax, filters, flexible locales, custom loaders,
    translation support for any classes, time and number localization, several
    user language support, agnostic core package with out-of-box support for
    Rails, Sinatra, Merb and desktop applications.
  EOF

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.extra_rdoc_files = ['README.rdoc', 'LICENSE']
  s.require_path = 'lib'
  s.has_rdoc = true

  s.add_dependency('sinatra', [">= 0.9"])
  s.add_dependency('r18n-core', ["= #{R18n::VERSION}"])
  s.add_development_dependency(%q<bundler>, [">= 1.0.10"])
  s.add_development_dependency(%q<rack-test>, [">= 0"])
  s.add_development_dependency(%q<rspec-core>, [">= 0"])
  s.add_development_dependency(%q<rspec-expectations>, [">= 0"])
  s.add_development_dependency(%q<rspec-mocks>, [">= 0"])
  s.add_development_dependency(%q<rcov>, [">= 0"])

  s.author = 'Andrey "A.I." Sitnik'
  s.email = 'andrey@sitnik.ru'
  s.homepage = 'http://r18n.rubyforge.org/'
  s.rubyforge_project = 'sinatra-r18n'
end

