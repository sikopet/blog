# Bash Login Scripts

See also [my dot-files](https://github.com/jreisinger/dot-files), ULSAH p. 189, [Prostredie shellu](http://prnet.duckdns.org/Linux1/ShellSkriptovanie/02ProstredieShellu).

When `bash` is started it runs a series of scripts to prepare the environment
for user. These scripts, for example, set the environment variables, create
command aliases, run programs.

<table>
  <tr>
    <th></th>
    <th>Login shell (variables like PATH, PS1 and startup programs like umask)</th>
    <th>Non-login shell (aliases, functions)</th>
  </tr>
  <tr>
    <th>Global config</th>
    <td><code>/etc/profile</code>, <code>/etc/profile.d/</code></td>
    <td><code>/etc/bash.bashrc</code>, <code>/etc/bash/bashrc</code>, <code>/etc/bashrc</code></td>
  </tr>
  <tr>
    <th>User config</th>
    <td><code>~/.bash_profile</code>, <code>~/.bash_login</code>, <code>~/.profile</code></td>
    <td><code>~/.bashrc</code></td>
  </tr>
</table>

 * login shell -- a shell started by the `login` program or a remote login server such as SSH
 * non-login shell -- not started by the `login` (ex. shell inside an X-based terminal); run on every instance; place for aliases and functions
 
Creating a symlink between `~/.bashrc` and `~/.bash_profile` will ensure that the same startup scripts run for both login and non-login sessions. Debian's `~/.profile` sources `~/.bashrc`, which has the same effect.
