# Creating a Module::Build Distribution
###### perl

Create config file `~/.module-starter/config`:

    author: Foo Bar
    email: foo@bar.org
    builder: Module::Build
    verbose: 1
    # Add new modules to existing distro.
    plugins: Module::Starter::AddModule

Run commands:

* create initial distro: `$ module-starter --module=Animal`
* change to distro dir: `$ cd Animal`
* create the `Build` script: `$ perl Build.PL`
* build the distro: `$ ./Build`
* make sure the tests pass: `$ ./Build test` (most frequent command)
* test the distro: `$ ./Build disttest`
* create the distro: `$ ./Build dist`

--

* add new module(s): `$ module-starter --module=Sheep,Cow,Horse --dist=.`
* you don't have to use config file: `$ module-starter --plugin=Module::Starter::AddModule --module=Sheep,Cow,Horse --dist=. --email=foo@bar.org`
