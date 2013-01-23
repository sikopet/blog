# LDAP
###### linux

 * network authentication (login) protocol (like Kerberos, Windows NT domains, NIS, AD ("LDAP + Kerberos"))
 * good for bigger networks
 * replacement for `useradd`, `usermod`, `passwd`, `/etc/passwd`, `/etc/shadow`
 * LDAP directory = hierarchical DB, more often read than written
 * LDAP directory root = _base_

# Preparing system to use LDAP

 * `# aptitude install openldap-utils`
 * `/etc/ldap/ldap.conf`
```
BASE        dc=example,dc=com                   # LDAP base - usually domain name
URI         ldaps://ldap.example.com            # ldap://, ldaps://
TLS_CACERT  /etc/ldap/ssl/certs/slapd-cert.crt  # certificate file (encryption)
```

# LDIF files
 * LDAP Data Interchange Format
 * User data (equivalent to `/etc/passwd`)
```none
dn: cn=jbond,ou=group,dc=openhouse,dc=sk
cn: jbond       # Linux username
gidNumber: 1010
objectClass: top 
objectClass: posixGroup
    
dn: uid=jbond,ou=people,dc=openhouse,dc=sk
uid: jbond
uidNumber: 1010  # Linux UID
gidNumber: 1010
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
```

 * group data (equivalent to `/etc/group`)
```none
dn: cn=users,ou=Group,dc=openhouse,dc=sk
objectClass: posixGroup
objectClass: top
cn: users
userPasssword: {crypt}x
gitNumber: 100
memberUid: jbond
```
 * you can create encrypted password via `slappasswd` and copy/paste it into an LDIF file

 * if account/group directory is empty, you must initialize it with special entries
```
dn: dc=openhouse,dc=sk
objectClass: domain
dc: openhouse

dn: ou=People,dc=openhouse,dc=sk
ou: People
objectClass: organizationalUnit
```
```
dn: ou=Group,dc=openhouse,dc=sk
ou: Group
objectClass: organizationalUnit
```

# Adding accounts

 * `$ ldapadd -c -x -D cn=admin,dc=openhouse,dc=sk -W -f acct.ldif`
  * `-c` -- continue even if errors are detected
  * `-x` -- use a simpler authentication rather than the default SASL
  * `-D` -- binds to the directory using the specified distinguished name (DN)
  * `-W <binddn>` -- prompt for authentication
  * `-f <file>` -- read LDIF records from <file>

# Changing password

 1. use `slappasswd`, cut/paste the hash into the LDIF file and run it through `ldapmodify`
 1. `$ ldappasswd -D cn=admin,dc=openhouse,dc=sk -W -S uid=jbond,ou=People,dc=openhouse,dc=sk`
  * `-S` -- prompts for the new password
 1. if PAM is configured correctly, user can use `passwd` on an LDAP client

# Deleting accounts

 * `$ ldapdelete -c -x -D cn=admin,dc=openhouse,dc=sk -W uid=jlebowski,ou=people,dc=openhouse,dc=sk
`

# Querying a server about accounts

 1. `$ getent passwd jbond` (`getent` returns info from various sources, including local account DB)
 1. `$ ldapsearch -x uid=jbond`
  * you can use filters (conceptually similar to regexes): `(&(uid=jbond)(!(ou=Accounting)))` -- search for `jbond` who is _not_ a member of the Accounting department
