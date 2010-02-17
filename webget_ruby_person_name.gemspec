Gem::Specification.new do |s|

  s.name              = "webget_ruby_person_name"
  s.summary           = "WebGet Ruby Gem: PersonName mixin methods to calculate a person's full name, sortable name, etc."
  s.version           = "1.0.2"
  s.author            = "WebGet"
  s.email             = "webget@webget.com"
  s.homepage          = "http://webget.com/"
  s.signing_key       = '/home/webget/keys/certs/webget.com.rsa.private.key.and.certificate.pem'
  s.cert_chain        = ['/home/webget/keys/certs/webget.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true
  s.files             = ['lib/webget_ruby_person_name.rb']
  s.test_files        = ['test/webget_ruby_person_name_test.rb']

end
