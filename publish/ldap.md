# LDAP
###### linux, networking

## Concepts and terms

* protocol for querying and modifying a X.500-based directory service running over TCP/IP
* current version - LDAPv3 (defined in [RFC4510](http://tools.ietf.org/html/rfc4510))
* Debian uses [OpenLDAP](http://www.openldap.org/) implementation (`slapd` package)
* can be used for network authentication (login), similarly like Kerberos, Windows NT domains, NIS, AD ("LDAP + Kerberos")
 * replacement for `useradd`, `usermod`, `passwd`, `/etc/passwd`, `/etc/shadow`
* good for bigger networks

LDAP directory 

* hierarchical DB, more often read than written
* tree of entries or directory information tree (DIT)
* LDAP directory root = *base*

LDAP entry

* consists of set of *attributes*
* an attribute has a *type* (a name/description) and one or more *values*
* every attribute has to be defined in a at least one *objectClass* (a special kind of attribute)
* attributes and objeclasses are defined in *schemas*
* each entry has a unique identifier: *distinguished name* (DN) = RDN + parent entry's DN
 * DN: "cn=John Doe,dc=example,dc=com"
 * RDN: "cn=John Doe"
 * parent DN: "dc=example,dc=com"
* DN in not an attribute, i.e. no part of the entry itself

## Preparing system to use LDAP (Debian 6.0.7)

Set FQDN if not already set ([Debian](http://wiki.debian.org/HowTo/ChangeHostname)):

* `/etc/hostname` (this file should only contain the hostname and not the full FQDN):

        ldap
        
* `/etc/hosts`:

        127.0.0.1       ldap.example.com ldap localhost
        # ... IPv6 stuff skipped ...
        1.2.3.4         ldap.example.com ldap
        
* Restart networking:

        invoke-rc.d hostname.sh start
        invoke-rc.d networking force-reload

Install packages:

    aptitude install slapd ldap-utils
    
Configure `ldap-utils`:

    cp -p /etc/ldap/ldap.conf{,.orig}
    
    cat << EOF > /etc/ldap/ldap.conf
    # LDAP base - usually domain name
    BASE        dc=example,dc=com
    # ldap://, ldaps://
    URI         ldaps://ldap.example.com
    # certificate file (encryption)
    TLS_CACERT  /etc/ldap/ssl/certs/slapd-cert.crt
    EOF
    
## Populate LDAP via LDIF files

Create LDIF (LDAP Data Interchange Format) file with basic tree structure (`/var/tmp/tree.ldif`):

        # Account directory
        dn: ou=People,dc=example,dc=com
        ou: People
        objectClass: organizationalUnit

        # Group directory
        dn: ou=Group,dc=example,dc=com
        ou: Group
        objectClass: organizationalUnit

Create LDIF file with user account information (`/var/tmp/acct.ldif`):

        # User data (equivalent to /etc/passwd)
        dn: uid=jlebowski,ou=people,dc=example,dc=com
        uid: jlebowski
        uidNumber: 1010
        gidNumber: 100
        cn: Jeffrey
        sn: Lebowski
        displayName: JeffreyLebowski
        mail: the.dude@example.com
        objectClass: top
        objectClass: person
        objectClass: posixAccount
        objectClass: shadowAccount
        objectClass: inetOrgPerson
        loginShell: /bin/bash
        homeDirectory: /home/jlebowski

        # Group data (equivalent to /etc/group)
        dn: cn=users,ou=Group,dc=example,dc=com
        objectClass: posixGroup
        objectClass: top
        cn: users
        gidNumber: 100
        memberUid: jlebowski

Adding information from LDIF files to LDAP:

        ldapadd -c -x -D cn=admin,dc=example,dc=com -W -f /var/tmp/tree.ldif
        ldapadd -c -x -D cn=admin,dc=example,dc=com -W -f /var/tmp/acct.ldif

* `-c` -- continue even if errors are detected
* `-x` -- use a simpler authentication rather than the default SASL
* `-D` -- binds to the directory using the specified distinguished name (DN)
* `-W <binddn>` -- prompt for authentication
* `-f <file>` -- read LDIF records from <file>

## Accounts management

Changing password - one of:

* use `slappasswd`, cut/paste the hash into the LDIF file and run it through `ldapmodify`:

        ldappasswd -D cn=admin,dc=example,dc=com -W -S uid=jlebowski,ou=People,dc=example,dc=com

 * `-S` -- prompts for the new password
* if PAM is configured correctly, user can use `passwd` on an LDAP client

Deleting accounts:

        ldapdelete -c -x -D cn=admin,dc=example,dc=com -W uid=jlebowski,ou=people,dc=example,dc=com

## Querying a server about accounts

### Linux

See also [Querying Active Directory with Unix LDAP tools](http://jrwren.wrenfam.com/blog/2006/11/17/querying-active-directory-with-unix-ldap-tools/).

* `getent` returns info from various sources, including local account DB

        getent passwd jlebowski

* you can use filters (conceptually similar to regexes):

        ldapsearch -x uid=jlebowski
        
 * `(&(uid=jlebowski)(!(ou=Accounting)))` -- search for `jlebowski` who is _not_ a member of the Accounting department
 
* when `ldapsearch` sees UTF-8 encoding it displays it as base64, so you need to convert it:

        ldapsearch -x -h ldap.company.com -b 'dc=company,dc=com' -s sub -D 'user@company.com' -S 'employeeID' \
        -W '(&(objectClass=person)(employeeID>=0)(employeeID<=20416))' employeeID title sn | PERL_UNICODE=S \
        perl -MMIME::Base64 -MEncode=decode -n -00 -e 's/\n //g;s/(?<=:: )(\S+)/decode("UTF-8",decode_base64($1))/eg;print' \
        > ldap.out

### Windows

Use GUI tools like [ADExplorer](http://technet.microsoft.com/en-us/sysinternals/bb963907.aspx) or [LDAP Admin](http://www.ldapadmin.org/).

## More

* [Ubuntu LDAP guide](https://help.ubuntu.com/12.04/serverguide/openldap-server.html)
* [Querying LDAP from Perl](https://github.com/jreisinger/audit/blob/master/orsr/lib/My/Ldap.pm)
* Perl Cookbook: 18.8 Accessing an LDAP Server (p. 738)
