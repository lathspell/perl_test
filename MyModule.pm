package MyModule;

use base 'Exporter';
our @EXPORT_OK = ('myfunc');

sub myfunc() {
    print("myfunc!\n");
}

sub myfunc2() {
    print("myfunc2!\n");
}

return 1;
