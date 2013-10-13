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
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;* rubber-resque.yml</td><td>





</td></tr>
<tr><td>&nbsp;&nbsp;* <a href="https://github.com/rubber/rubber/blob/master/templates/resque/config/resque.yml">resque.yml</a></td><td>

  <h3>resque config</h3>

  <h4>target</h4>
  <code>[RAILS_ROOT]/config/resque.yml</code><p />

</td></tr>
<tr><td>&nbsp;&nbsp;* <a href="https://github.com/rubber/rubber/blob/master/templates/resque/config/resque-pool.yml">resque-pool.yml</a></td><td>

  <h3>resque-pool config</h3>

  <h4>target</h4>
  <code>[RAILS_ROOT]/config/resque-pool.yml</code><p />

</td></tr>
<tr><td>&nbsp;&nbsp;* <a href="https://github.com/rubber/rubber/blob/master/templates/resque/config/resque-web.ru">resque-web.ru</a></td><td>

  <h3>Rack initializer for resque-web</h3>

  <h4>target</h4>
  <code>[RAILS_ROOT]/config/resque-web.ru</code><p />

</td></tr>
<tr><td>* lib</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;* tasks</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;* <a href="https://github.com/rubber/rubber/blob/master/templates/resque/lib/tasks/resque.rake">resque.rake</a></td><td>

  <h3>Rake file for resque-pool</h3>
  
  <h4>target</h4>
  <code>[RAILS_ROOT]/lib/tasks/resque.rake</code><p />
  
  See https://github.com/nevans/resque-pool#rake-task-config

</td></tr>
<tr><td>* <a href="https://github.com/rubber/rubber/blob/master/templates/resque/templates.rb">templates.rb</a></td><td>

  <h3>Adds these gems to your Gemfile</h3>
  
  <ul>
  <li><code>resque</code></li>
  <li><code>resque-pool</code></li>
  <li><code>puma</code></li>
  </ul>

</td></tr>
<tr><td>* templates.yml</td><td>

  Rubber specific - lists dependencies (redis)

</td></tr>
</table>

Rubber has the concept of 'cross-cutting-templates', one of these templates is the `monit` template which has to be included in the chef recipe. See [monit](http://mmonit.com/monit/) for more information.

Repository structure of rubbers monit template - can be found [here](https://github.com/rubber/rubber/tree/master/templates/monit)

<table>
<tr><td>* config</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;* rubber</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;* role</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* resque_web</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* <a href="https://github.com/rubber/rubber/blob/master/templates/monit/config/rubber/role/resque_web/monit-resque_web.conf">monit-resque_web.conf</a></td><td>

  <h3>monit config (ERB)</h3>
  
  <h4>target</h4>
  <code>/etc/monit/monit.d/monit-resque_web.conf</code><p />
  
  <h4>parameter: resque_web_pid_file</h4>
  <code>resque_web_pid_file = /var/run/resque-web.pid</code>
  
  <h4>parameter: Rubber.env</h4>
  <code>Rubber.env = staging | default | production | whatever</code>

</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* resque_worker</td><td>Directory</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* <a href="https://github.com/rubber/rubber/blob/master/templates/monit/config/rubber/role/resque_worker/monit-resque_pool.conf">monit-resque_pool.conf</a></td><td>

  <h3>monit config (ERB)</h3>
  
  <h4>target</h4>
  <code>/etc/monit/monit.d/monit-resque_pool.conf</code><p />
  
  <h4>parameter: resque_pool_pid_file</h4>
  <code>resque_pool_pid_file = /var/run/resque-pool.pid</code>
  
  <h4>parameter: Rubber.env</h4>
  <code>Rubber.env = staging | default | production | whatever</code>

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

  <h3>Rubber specific..<h3>
  
  <h4>admin port</h4>
  <code>monit_admin_port: 2812</code>

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
