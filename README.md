#Rubber-chef-resque

[Rubber](https://github.com/rubber/rubber/)'s resque capistrano template translated to Chef.

Unfortunately the [resque cookbook](http://community.opscode.com/cookbooks/resque) on the opscode community site is no longer maintained by its creators at infochimps and is no longer working (out of the box) due to a dependency on a forked `runit` cookbook.

Before coming to [chef](http://docs.opscode.com/) I used [rubber](https://github.com/rubber/rubber) to provision my servers and it contained a resque setup that is pretty good.

This cookbook is one-to-one copy of rubbers resque template but now implemented as chef recipes instead of the original capistrano templates.

It uses [resque-pool](https://github.com/nevans/resque-pool) to manage resque workers and [monit](http://mmonit.com/monit/) to monitor resque-pool and resque's builtin resque-web. 

I use the [apsoto/monit](https://github.com/apsoto/monit) cookbook (which is on the community site as 'monit').

There is an [analysis of the resque template in rubber](https://github.com/dmdeklerk/rubber-chef-resque/wiki/rubber-analysis) on my wiki.

#Resources

* https://github.com/resque/resque
* https://github.com/nevans/resque-pool
* https://github.com/rubber/rubber
* https://github.com/capistrano/capistrano
* http://mmonit.com/monit/
* https://github.com/apsoto/monit (chef cookbook)
* http://www.opscode.com/chef/
* http://upstart.ubuntu.com/getting-started.html
* http://upstart.ubuntu.com/cookbook/
