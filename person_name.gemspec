Gem::Specification.new do |s|

  s.name              = "webget_ruby_person_name"
  s.summary           = "WebGet.com Ruby mixin methods for a person's full name, sort name, etc."
  s.version           = "1.0.0"
  s.author            = "WebGet"
  s.email             = "webget@webget.com"
  s.homepage          = "http://webget.com/gems/person_name"
  s.signing_key       = '/home/webget/keys/certs/webget.com.rsa.private.key.and.certificate.pem'
  s.cert_chain        = ['/home/webget/keys/certs/webget.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true
  s.files             = ['lib/person_name.rb']
  s.test_files        = ['test/unit/person_name_test.rb']

end
