name		          'rubber-chef-resque'
maintainer        'Dennis de Klerk'
maintainer_email  'dmdeklerk@gmail.com'
license           'MIT'
description       'Installs and configures resque'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.0.1'


recipe            'rubber-chef-resque::resque_web', 'Installs a resque web-server'
recipe            'rubber-chef-resque::resque_worker', 'Installs a resque worker'

supports 'ubuntu'

depends 'monit'
