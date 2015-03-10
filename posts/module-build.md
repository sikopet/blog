## Creating a Module::Build Distribution

We show here how to create a Perl distribution using `Module::Build` build system with `Module::Starter`. The other common build systems (we don't show here) are `ExtUtils::MakeMaker`. For sophisticated distribution creation see [Dist::Zilla](http://dzil.org/).

Create config file `~/.module-starter/config`:

    author: Foo Bar
    email: foo@bar.org
    builder: Module::Build
    verbose: 1
    # Allow adding new modules to existing distro.
    plugins: Module::Starter::AddModule
    
... or use `module-starter` (see below) command line arguments like:

    --author="Foo Bar" \
    --email=foo@bar.org \
    --mb \
    --verbose \
    --plugin=Module::Starter::AddModule
    
Run basic commands

* install modules: `cpanm Module::Build Module::Starter Module::Starter::AddModule`
* create (a working skeleton of) module distribution: `module-starter --module=Animal` 
* change to distro dir: `cd Animal`
* create the `Build` script: `perl Build.PL`
* build the distro (modules from `lib` copied to `blib` staging area and embedded documenation translated into Unix manpage in `blib/libdoc`): `./Build`
* make sure the tests pass: `./Build test` (most frequent command or run individual tests)
* test the distro: `./Build disttest`
* create the distro: `./Build dist`

Add modules

* add new module(s): `module-starter --module=Sheep,Cow,Horse --dist=.`

Run individual tests

* rebuild distro and run test including modules from `blib/lib`: `./Build && perl -Iblib/lib -T t/Cow.t`
* rebuild distro and run test including modules from `blib/lib`: `./Build && perl -Mblib -T t/Cow.t`

Measure out test coverage

* run `testcover` target: `./Build testcover`
* turn the collected statistics into human-readable reports: `cover`

