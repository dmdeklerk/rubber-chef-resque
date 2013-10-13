#Rubber-chef-resque

Rubber's Resque (plus resque-pool) Capistrano Template Translated Into Chef Recipe.

#Intro

Unfortunately the [resque cookbook](http://community.opscode.com/cookbooks/resque) on the opscode community site is no longer maintained by its creators at infochimps and is no longer working due to a dependency on a forked `runit` cookbook.

Before coming to [chef](http://docs.opscode.com/) I used [rubber](https://github.com/rubber/rubber) to provision my servers and it contained a resque setup that I really liked.

This cookbook is one-to-one copy of rubbers resque template but now implemented as chef recipes instead of the original capistrano templates.

#Analysis

Repository structure of rubbers resque template - can be found [here](https://github.com/rubber/rubber/tree/master/templates/resque)

<table>
<tr><td>* config</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;* initializers</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;* resque.rb</td><td> ? </td></tr>
<tr><td>&nbsp;&nbsp;* rubber</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;* common</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* resque.yml</td><td> ? </td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;* role</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* resque_web</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* resque-web-upstart.conf</td><td> ? </td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* resque_worker</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* resque-pool.yml</td><td> ? </td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* resque-pool-upstart.conf</td><td> ? </td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;* deploy-resque.rb</td><td> ? </td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;* rubber-resque.yml</td><td> ? </td></tr>
<tr><td>&nbsp;&nbsp;* resque.yml</td><td> ? </td></tr>
<tr><td>&nbsp;&nbsp;* resque-pool.yml</td><td> ? </td></tr>
<tr><td>&nbsp;&nbsp;* resque-web.ru</td><td> ? </td></tr>
<tr><td>* lib</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;* tasks</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;* resque.rake</td><td> ? </td></tr>
<tr><td>* templates.rb</td><td>Adds `resque`, `resque-pool` and `puma` gems to the projects main Gemfile</td></tr>
<tr><td>* templates.yml</td><td>Rubber specific - lists dependencies (redis)</td></tr>
</table>

Rubber has the concept of 'cross-cutting-templates', one of these templates is the `monit` template which has to be included in the chef recipe. See [monit](http://mmonit.com/monit/) for more information.

Repository structure of rubbers monit template - can be found [here](https://github.com/rubber/rubber/tree/master/templates/monit)

<table>
<tr><td>* config</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;* rubber</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;* role</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* resque_web</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* monit-resque_web.conf</td><td> ? </td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* resque_worker</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* monit-resque_pool.conf</td><td> ? </td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;* deploy-monit.rb</td><td> ? </td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;* rubber-monit.yml</td><td> ? </td></tr>
<tr><td>* templates.yml</td><td>Rubber specific</td></tr>
</table>



#Resources

* https://github.com/resque/resque
* https://github.com/nevans/resque-pool
* https://github.com/rubber/rubber
* https://github.com/capistrano/capistrano
