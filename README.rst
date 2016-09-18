Custom phpfarm settings for Erebot
==================================

This repository contains several files used by phpfarm to build PHP versions
for Erebot.

Usually, only ``default-versions.txt`` will change when a new version of PHP
is released. Some files will also be renamed due to being tied to a particular
version and so must be renamed when the version changes.


Maintained versions
-------------------

I currently keep several versions, spread across the following PHP branches:

* PHP 5.3.x
* PHP 5.4.x
* PHP 5.5.x
* PHP 5.6.x
* PHP 7.0.x
* PHP 7.1.x
* test builds (nightly, alpha/beta/RC, etc.)

For each branch, I build two "flavours":

* A 64-bits version with a pear installation and debugging symbols.
* A 32-bits version with a pear installation but no debugging symbols.

These branches match the current stable branches from the official PHP project,
with the addition of PHP 5.3.x and PHP 5.4.x which you can still find on some
(maintained) Linux distributions, eg. RedHat Enterprise Linux 5.x.

Sometimes, I build specific versions based on projects requirements.


Native extensions
-----------------

Due to the lack of multiarch packages in Debian for some of the development
headers required by miscelleanous PHP extensions and to avoid extra headaches,
the versions have been somewhat stripped down.

More specifically, all native extensions have been disabled, except for:

* bcmath
* bz2
* calendar
* Core
* ctype
* date
* dom
* ereg (removed from PHP 7.0.0 onwards)
* filter
* gettext
* gmp
* hash
* iconv
* intl
* json
* libxml
* mbstring
* mysql (removed from PHP 7.0.0 onwards)
* mysqli
* mysqlnd
* opcache (added from PHP 5.5.x onwards)
* openssl
* pcntl
* pcre
* PDO
* pdo_mysql
* pdo_sqlite
* Phar
* posix
* readline
* Reflection
* session
* SimpleXML
* soap
* sockets
* SPL
* sqlite3
* standard
* sysvmsg
* sysvsem
* sysvshm
* tokenizer
* xml
* xmlreader
* xmlwriter
* xsl
* zip
* zlib

The main version also has the following extensions:

* fileinfo
* gd
* mcrypt
* pdo_pgsql
* pgsql
* snmp

Whenever possible, each extension is built as a shared dynamically linked
library, ie. as an ``.so`` file.


PEAR packages / PECL extensions
-------------------------------
No PEAR package gets installed automatically (I tend to use Composer to
manage PHP code, so there is no real need for PEAR packages anyway).

The following PECL extensions are installed:

* pecl_http (aka. http)
* propro (dependency for pecl_http)
* raphf (dependency for pecl_http)
* tideways
* vld
* xdebug
* -xhprof- (replaced by the Tideways PHP profiler)


Additionally, the main version also has the following PECL extensions:

* curl
* krb5
* ssh2


Other features
--------------
When supported by a particular version, the following features are used:

* ``--disable-all``
* ``--disable-short-tags``
* ``--disable-sigchild``
* ``--with-layout=GNU``
* ``--with-readline``
* ``--disable-mysqlnd-compression-support``
* ``--enable-gcc-global-regs``
* ``--enable-zend-multibyte``
* ``--enable-sqlite-utf8``
* ``--enable-ucd-snmp-hack``
* ``--enable-phpdbg`` (phpdbg)
* ``--enable-fpm`` (php-fpm)


Specific php.ini settings
-------------------------
I use the default php.ini.dist file with a few changes listed below:

* The ``include_path`` is set so that packages installed through PEAR can still
  be used, ie. it includes PEAR's ``php`` directory

* The ``extension_dir`` is set so that PECL and shared extensions can be loaded

* -A default output directory as been set for xhprof's trace files-

* ``phar.readonly`` is Off

* Unicode detection is Off

* ``error_reporting`` reports any potential issue PHP detects, even tiny little
  ones like notices and deprecation warnings

* The ``memory_limit`` has been raised to 256 MB

* Xdebug's ``max_nesting_level`` has been raised to 200 to allow for more
  recursion

* ``tideways.auto_prepend_library=0`` is set to use the open-source version
  of the tideways profiler


Special patches
---------------
The following special patches have been applied:

* ``icu-pkg-config.diff`` for PHP 5.5.0 onwards: makes ``./configure`` use
  ``pkg-config`` instead of ``icu-config`` to determine ICU's location.
  This is necessary on multiarch systems because ``icu-config``'s paths are
  hardcoded for a certain processor architecture.

* ``icu-pkg-config54.diff`` for PHP versions up to 5.4.x: same as above.

* ``patch-openssl-php53.diff`` for PHP 5.3.x: makes the ``openssl.so`` shared
  library link to ``libssl.so`` and ``libcrypto.so``, even when they are not
  in their usual location (this is the case on multiarch systems where they
  will be in an architecture-specific directory).
  This, in turn, avoids errors about missing symbols when loading ``openssl.so``
  (``undefined symbol GENERAL_NAME_free``).

* ``patch-openssl10-php53.diff`` for PHP 5.3.x: adds compatibility with the
  structures used in openssl 1.0.x.

