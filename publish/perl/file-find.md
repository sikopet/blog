# Processing Files Recursively (File::Find)

Sometimes I need to do something to many/all files within certain directory:

    use File::Find;
    sub process_file {
        # do something;
    }
    find(\&process_file, @DIRLIST);

`find` function from `File::Find` scans directories in `@DIRLIST` recursively and for each file calls the referenced function or "coderef" (`process_file`).

## More

* perldoc
* Perl Cookbook
