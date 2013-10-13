#Rubber-chef-resque

[Rubber](https://github.com/rubber/rubber/)'s resque capistrano template translated to Chef.

Unfortunately the [resque cookbook](http://community.opscode.com/cookbooks/resque) on the opscode community site is no longer maintained by its creators at infochimps and is no longer working (out of the box) due to a dependency on a forked `runit` cookbook.

Before coming to [chef](http://docs.opscode.com/) I used [rubber](https://github.com/rubber/rubber) to provision my servers and it contained a resque setup that is pretty good.

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
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* <a href="https://github.com/rubber/rubber/blob/master/templates/monit/config/rubber/role/resque_web/monit-resque_web.conf">monit-resque_web.conf</a></td><td>



</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* resque_worker</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* <a href="https://github.com/rubber/rubber/blob/master/templates/monit/config/rubber/role/resque_worker/monit-resque_pool.conf">monit-resque_pool.conf</a></td><td>


</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;* <a href="https://github.com/rubber/rubber/blob/master/templates/monit/config/rubber/deploy-monit.rb">deploy-monit.rb</a></td><td> 

<h3>Capistrano tasks..<h3>

<h4>start</h4>
<code>sudo service monit status || sudo service monit start</code>

<h4>stop</h4>
<code>sudo service monit stop || true</code>

<h4>display status</h4>
<code>sudo service monit status || true</code><p />
<code>sudo ps -eopid,user,fname | grep [m]onit || true</code><p />
<code>sudo netstat -tulpn | grep monit || true</code><p />

</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;* <a href="https://github.com/rubber/rubber/blob/master/templates/monit/config/rubber/rubber-monit.yml">rubber-monit.yml</a></td><td> 



</td></tr>
<tr><td>* templates.yml</td><td>Rubber specific</td></tr>
</table>



#Resources

* https://github.com/resque/resque
* https://github.com/nevans/resque-pool
* https://github.com/rubber/rubber
* https://github.com/capistrano/capistrano
* http://mmonit.com/monit/
* http://www.opscode.com/chef/
