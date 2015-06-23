<h1><strong>awesome-console</strong></h1>

<p><strong>awesome-console</strong> is a simple bash script designed to deploy tmux with tmuxinator.</p>

<h2>Usage</h2>

<pre>
<strong>git clone https://github.com/64b2b6d12b/awesome-console.git</strong>
<strong>cd awesome-console</strong>
<strong>chmod +x console.sh</strong>
<strong>./console.sh</strong></pre>

<h2>Prerequisites</h2>

<p>This script is designed to run on CentOS 6.x. Other distributions/versions have not yet been tested.</p>

<h2>Dependencies</h2>

<p>Although the script will automatically install the needed dependencies from <strong>yum</strong> if not available, the following is required:</p>

<ul>
	<li>ncurses</li>
	<li>&lsquo;development tools&rsquo; group install</li>
</ul>

<h2>What the script does</h2>

<ul>
	<li>Installs ncurses and &lsquo;development tools&rsquo; group install if not yet installed</li>
	<li>Compiles tmux from source</li>
	<li>Installs RVM (Ruby Version Manager)</li>
	<li>Installs Ruby Gems</li>
	<li>Installs tmuxinator</li>
</ul>
