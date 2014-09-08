## Creating a Module::Build Distribution

Create config file `~/.module-starter/config`:

    author: Foo Bar
    email: foo@bar.org
    builder: Module::Build
    verbose: 1
    # Allow adding new modules to existing distro.
    plugins: Module::Starter::AddModule
    
.. or use command line arguments like:

    --email=foo@bar.org
    --plugin=Module::Starter::AddModule
    
Basic commands

* install modules: `cpanm Module::Build Module::Starter Module::Starter::AddModule`
* create initial distro: `module-starter --module=Animal`
* change to distro dir: `cd Animal`
* create the `Build` script: `perl Build.PL`
* build the distro: `./Build`
* make sure the tests pass: `./Build test` (most frequent command)
* test the distro: `./Build disttest`
* create the distro: `./Build dist`

Adding modules

* add new module(s): `module-starter --module=Sheep,Cow,Horse --dist=.`

Running individual tests

* rebuild distro and run test including modules from `blib/lib`: `./Build && perl -Iblib/lib -T t/Cow.t`
* rebuild distro and run test including modules from `blib/lib`: `./Build && perl -Mblib t/Cow.t`
