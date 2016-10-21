Introduction
==============

Basic tools i use on a regular basis specific to my linux environments.  After blowing away far too many of these environments im finally starting to move these to a git repo.

## Table of Contents

**[Bash](#bash)**<br />
&nbsp;&nbsp;[Pycharm Keyboard Fix](#pycharm-keyboard-fix)<br />
**[Python](#python)**<br />
&nbsp;&nbsp;[PostgresBase](#postgresbase)<br />

Bash
==============
Python tools.

Pycharm Keyboard Fix
--------------
Kills the process responible for monitoring the keyboard in the intellij IDE.  This seems to hang quite frequently in a VMWare Ubuntu envirnment.


Python
==============
Python tools.

PostgresBase
--------------
Utilizes the psycopg2 python library and extends it to wrap the connection pooling into a context manager.  This handles the issue with dangling connections cleanly.  The base library just closes the transaction.
