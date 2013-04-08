# LDAP
###### linux

* protocol for querying and modifying a X.500-based directory service running over TCP/IP
* current version - LDAPv3 (defined in [RFC4510](http://tools.ietf.org/html/rfc4510))
* Debian uses OpenLDAP implementation
* can be used for network authentication (login), similarly like Kerberos, Windows NT domains, NIS, AD ("LDAP + Kerberos")
 * replacement for `useradd`, `usermod`, `passwd`, `/etc/passwd`, `/etc/shadow`
* good for bigger networks

## Concepts and terms

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

## Preparing system to use LDAP

    # aptitude install openldap-utils
    # cp -p /etc/ldap/ldap.conf{,.orig}
    # cat << EOF > /etc/ldap/ldap.conf
    BASE        dc=example,dc=com                   # LDAP base - usually domain name
    URI         ldaps://ldap.example.com            # ldap://, ldaps://
    TLS_CACERT  /etc/ldap/ssl/certs/slapd-cert.crt  # certificate file (encryption)
    EOF

## LDIF files

* LDAP Data Interchange Format

User data (equivalent to `/etc/passwd`)

    dn: uid=jbond,ou=people,dc=openhouse,dc=sk
    uid: jbond       # Linux username
    uidNumber: 1010  # Linux UID
    gidNumber: 100
    cn: James
    sn: Bond
    displayName: JamesBond
    mail: james.bond@gmail.com
    objectClass: top 
    objectClass: person
    objectClass: posixAccount
    objectClass: shadowAccount
    objectClass: inetOrgPerson
    loginShell: /bin/bash
    homeDirectory: /home/jbond

Group data (equivalent to `/etc/group`)

    dn: cn=users,ou=Group,dc=openhouse,dc=sk
    objectClass: posixGroup
    objectClass: top
    cn: users
    userPasssword: {crypt}x
    gitNumber: 100
    memberUid: jbond

 * you can create encrypted password via `slappasswd` and copy/paste it into an LDIF file

If account/group directory is empty, you must initialize it with special entries

    dn: dc=openhouse,dc=sk
    objectClass: domain
    dc: openhouse

    dn: ou=People,dc=openhouse,dc=sk
    ou: People
    objectClass: organizationalUnit


    dn: ou=Group,dc=openhouse,dc=sk
    ou: Group
    objectClass: organizationalUnit

## Adding accounts

`$ ldapadd -c -x -D cn=admin,dc=openhouse,dc=sk -W -f acct.ldif`

* `-c` -- continue even if errors are detected
* `-x` -- use a simpler authentication rather than the default SASL
* `-D` -- binds to the directory using the specified distinguished name (DN)
* `-W <binddn>` -- prompt for authentication
* `-f <file>` -- read LDIF records from <file>

## Changing password

One of:

* use `slappasswd`, cut/paste the hash into the LDIF file and run it through `ldapmodify`
* `$ ldappasswd -D cn=admin,dc=openhouse,dc=sk -W -S uid=jbond,ou=People,dc=openhouse,dc=sk`
 * `-S` -- prompts for the new password
* if PAM is configured correctly, user can use `passwd` on an LDAP client

## Deleting accounts

* `$ ldapdelete -c -x -D cn=admin,dc=openhouse,dc=sk -W uid=jlebowski,ou=people,dc=openhouse,dc=sk`

## Querying a server about accounts

### Linux

See also [Querying Active Directory with Unix LDAP tools](http://jrwren.wrenfam.com/blog/2006/11/17/querying-active-directory-with-unix-ldap-tools/).

* `$ getent passwd jbond` (`getent` returns info from various sources, including local account DB)
* `$ ldapsearch -x uid=jbond`
 * you can use filters (conceptually similar to regexes): `(&(uid=jbond)(!(ou=Accounting)))` -- search for `jbond` who is _not_ a member of the Accounting department

when `ldapsearch` sees UTF-8 encoding it displays it as base64, so you need to convert it:

    ldapsearch -x -h ldap.company.com -b 'dc=company,dc=com' -s sub -D 'user@company.com' -S 'employeeID' \
    -W '(&(objectClass=person)(employeeID>=0)(employeeID<=20416))' employeeID title sn | PERL_UNICODE=S \
    perl -MMIME::Base64 -MEncode=decode -n -00 -e 's/\n //g;s/(?<=:: )(\S+)/decode("UTF-8",decode_base64($1))/eg;print' \
    > ldap.out

### Windows

Use [ADExplorer](http://technet.microsoft.com/en-us/sysinternals/bb963907.aspx) for Windows.

## More

* <https://help.ubuntu.com/12.04/serverguide/openldap-server.html>
* <https://github.com/jreisinger/audit/blob/master/orsr/lib/My/Ldap.pm>
