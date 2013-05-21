<?php
/**
 * @copyright	Copyright 2006-2013, Miles Johnson - http://milesj.me
 * @license		http://opensource.org/licenses/mit-license.php - Licensed under the MIT License
 * @link		http://milesj.me/code/cakephp/utility
 */

Configure::write('debug', 2);
Configure::write('Cache.disable', true);

App::uses('BaseInstallShell', 'Utility.Console/Command');
App::uses('ConnectionManager', 'Model');
App::uses('Validation', 'Utility');
App::uses('AppShell', 'Console/Command');

abstract class BaseUpgradeShell extends BaseInstallShell {

	/**
	 * Array of completed version upgrades.
	 *
	 * @var array
	 */
	public $complete = array();

	/**
	 * Available upgrade versions.
	 *
	 * @var array
	 */
	public $versions = array();

	/**
	 * Set the list of available upgrade versions.
	 *
	 * @param array $versions
	 * @return BaseUpgradeShell
	 */
	public function setVersions(array $versions) {
		$this->versions = $versions;

		return $this;
	}

	/**
	 * Upgrade to a specific version and trigger any migration callbacks.
	 *
	 * @param int $version
	 * @return bool
	 */
	public function to($version) {
		$this->out(sprintf('<info>Upgrading to %s...</info>', $version));

		$schema = sprintf('%s/Config/Schema/Upgrade/%s.sql', CakePlugin::path($this->plugin), $version);

		if (!file_exists($schema)) {
			$this->err(sprintf('<error>Upgrade schema %s does not exist</error>', basename($schema)));
			return false;
		}

		// Trigger any migration changes
		$method = 'to_' . preg_replace('/[^0-9]+/', '', $version);

		if (method_exists($this, $method)) {
			call_user_func(array($this, $method));
		}

		// Execute the schema
		if ($this->executeSchema($schema, false)) {
			$this->complete[] = $version;

			$this->out(sprintf('<info>Upgrade to %s complete</info>', $version));
			$this->versions();
		}

		return true;
	}

	/**
	 * Output a list of available version to upgrade to.
	 */
	public function versions() {
		$this->hr(1);

		$versions = array();

		if ($this->versions) {
			foreach ($this->versions as $version => $title) {
				if (in_array($version, $this->complete)) {
					$this->out('[x] ' . $title);
				} else {
					$this->out(sprintf('[%s] <comment>%s</comment>', $version, $title));
					$versions[] = $version;
				}
			}
		} else {
			$this->err('<error>No versions found</error>');
			return;
		}

		$this->out('[E]xit');
		$this->out();

		$versions[] = 'E';
		$answer = strtoupper($this->in('<question>Which version do you want to upgrade to?</question>', $versions));

		if ($answer === 'E') {
			exit();
		}

		$this->to($answer);
	}

}